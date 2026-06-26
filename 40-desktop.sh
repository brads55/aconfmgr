# Desktop packages
AddPackage firefox # Fast, Private & Safe Web Browser
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage hyprpolkitagent # Simple polkit authentication agent for Hyprland, written in QT/QML
AddPackage kitty # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage niri # A scrollable-tiling Wayland compositor
AddPackage nvidia-open-dkms # NVIDIA open kernel modules - module sources
AddPackage partitionmanager # A KDE utility that allows you to manage disks, partitions, and file systems
AddPackage spotify-launcher # Client for spotify's apt repository in Rust for Arch Linux
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage wl-clip-persist # Keep Wayland clipboard even after programs close
AddPackage xdg-desktop-portal-gnome # Backend implementation for xdg-desktop-portal for the GNOME desktop environment
AddPackage xwayland-satellite # Xwayland outside your Wayland
AddPackage --foreign noctalia-shell # A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell.

# Autologin
CopyFile /etc/systemd/system/getty@tty1.service.d/autologin.conf

# Systemd services
SystemdEnable --type user gnome-keyring /usr/lib/systemd/user/gnome-keyring-daemon.socket
SystemdEnable --type user pipewire /usr/lib/systemd/user/pipewire.socket
SystemdEnable --type user wireplumber /usr/lib/systemd/user/wireplumber.service
SystemdEnable --type user xdg-user-dirs /usr/lib/systemd/user/xdg-user-dirs.service
SystemdEnable --type user p11-kit /usr/lib/systemd/user/p11-kit-server.socket
