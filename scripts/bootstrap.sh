#!/bin/sh

set -eu

TEMP=$(mktemp -d)
trap 'rm -rf "$TEMP"' EXIT INT TERM

sudo pacman -S --needed git base-devel

cd "$TEMP"
git clone https://aur.archlinux.org/yay.git

cd yay
cat PKGBUILD

read -p "Continue? [y/N] " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  exit 1
fi

makepkg -sic

yay -Y --gendb
yay -Yc
yay -R yay-debug

yay --diffmenu --removemake --answerclean All --answerdiff All --save
