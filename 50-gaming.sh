AddPackage discord # All-in-one voice and text chat for gamers
AddPackage gamemode # A daemon/lib combo that allows games to request a set of optimisations be temporarily applied to the host OS
AddPackage gamescope # SteamOS session compositing window manager
AddPackage mangohud # A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more.
AddPackage steam # Valve's digital software delivery system
AddPackage --foreign curseforge # CurseForge desktop client for Linux
AddPackage --foreign faugus-launcher # A simple and lightweight app for running Windows games using UMU-Launcher


echo "vm.max_map_count = 2147483642" > "$(CreateFile /etc/sysctl.d/80-gamecompatibility.conf)"
echo "ntsync" > "$(CreateFile /etc/modules-load.d/ntsync.conf)"
