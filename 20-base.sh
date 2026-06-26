# Base packages
AddPackage amd-ucode # Microcode update image for AMD CPUs
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages
AddPackage linux-firmware # Firmware files for Linux - Default set
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel

# Base system config
CopyFile /etc/fstab
CopyFile /etc/kernel/cmdline
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/London
echo "halite" > "$(CreateFile /etc/hostname)"
echo "LANG=en_GB.UTF-8" > "$(CreateFile /etc/locale.conf)"
echo "KEYMAP=uk" > "$(CreateFile /etc/vconsole.conf)"

# System manual
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages

# Locales
f="$(GetPackageOriginalFile glibc /etc/locale.gen)"
sed -i 's/^#\(en_GB.UTF-8\)/\1/g' "$f"
sed -i 's/^#\(en_US.UTF-8\)/\1/g' "$f"

# UEFI and Secure Boot
AddPackage edk2-shell # EDK2 UEFI Shell
AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager
AddPackage sbctl # Secure Boot key manager

# ESP + UKI
CopyFile /boot/loader/entries/windows.conf 700
CopyFile /boot/loader/loader.conf 700
CopyFile /etc/mkinitcpio.d/linux-zen.preset
CopyFile /etc/pacman.d/hooks/80-sign-systemd-boot.hook
CopyFile /etc/pacman.d/hooks/95-edk2-shell-install.hook
CopyFile /etc/pacman.d/hooks/95-systemd-boot.hook

# Systemd + Networking
SystemdEnable systemd /usr/lib/systemd/system/remote-fs.target
SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd.service
SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd.socket
SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd-varlink.socket
SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd-varlink-metrics.socket
SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd-resolve-hook.socket
SystemdEnable systemd /usr/lib/systemd/system/systemd-network-generator.service
SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd-wait-online.service
SystemdEnable systemd /usr/lib/systemd/system/systemd-resolved.service
SystemdEnable systemd /usr/lib/systemd/system/systemd-resolved-varlink.socket
SystemdEnable systemd /usr/lib/systemd/system/systemd-resolved-monitor.socket
SystemdEnable systemd /usr/lib/systemd/system/systemd-timesyncd.service
SystemdEnable systemd /usr/lib/systemd/system/systemd-userdbd.socket
SystemdEnable --name getty@tty1.service systemd /usr/lib/systemd/system/getty@.service
CreateLink /etc/resolv.conf /run/systemd/resolve/stub-resolv.conf
CopyFile /etc/systemd/network/89-ethernet.network

# Hardware workarounds
CopyFile /etc/systemd/system/fix-msi-wakeup.service
SystemdEnable --from-file /etc/systemd/system/fix-msi-wakeup.service

# Archlinux config
CopyFile /etc/makepkg.conf
CopyFile /etc/pacman.conf
AddPackage pkgfile # A tool to search for files in official repository packages
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign debfoster # Install only wanted Debian packages
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.

# Security
AddPackage sudo # Give certain users the ability to run some commands as root
CopyFile /etc/sudoers
