# Desktop packages
AddPackage firefox # Fast, Private & Safe Web Browser
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage hyprpolkitagent # Simple polkit authentication agent for Hyprland, written in QT/QML
AddPackage kitty # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage libappindicator # Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray
AddPackage niri # A scrollable-tiling Wayland compositor
AddPackage nvidia-open-dkms # NVIDIA open kernel modules - module sources
AddPackage partitionmanager # A KDE utility that allows you to manage disks, partitions, and file systems
AddPackage spotify-launcher # Client for spotify's apt repository in Rust for Arch Linux
AddPackage ttf-fantasque-nerd # Patched font Fantasque Sans Mono from nerd fonts library
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage wl-clip-persist # Keep Wayland clipboard even after programs close
AddPackage xdg-desktop-portal-gnome # Backend implementation for xdg-desktop-portal for the GNOME desktop environment
AddPackage xwayland-satellite # Xwayland outside your Wayland
AddPackage --foreign xembedsniproxy
AddPackage --foreign noctalia-shell # A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell.

# Audio ducking
AddPackage easyeffects # Audio Effects for Pipewire applications
AddPackage lsp-plugins # Collection of open-source plugins
AddPackage qpwgraph # PipeWire Graph Qt GUI Interface

# Push to talk
AddPackage --foreign wayland-push-to-talk-fix-git # This fixes the inability to use push to talk in Discord when running Wayland
AddPackage xdotool # Command-line X11 automation tool
CopyFile /etc/sudoers.d/push-to-talk 440

# Autologin
CopyFile /etc/systemd/system/getty@tty1.service.d/autologin.conf

# Systemd services
SystemdEnable --type user gnome-keyring /usr/lib/systemd/user/gnome-keyring-daemon.socket
SystemdEnable --type user pipewire /usr/lib/systemd/user/pipewire.socket
SystemdEnable --type user pipewire-pulse /usr/lib/systemd/user/pipewire-pulse.socket
SystemdEnable --type user wireplumber /usr/lib/systemd/user/wireplumber.service
SystemdEnable --type user xdg-user-dirs /usr/lib/systemd/user/xdg-user-dirs.service
SystemdEnable --type user p11-kit /usr/lib/systemd/user/p11-kit-server.socket
