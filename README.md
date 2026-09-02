# GayOS Linux

GayOS is an Arch Linux-based desktop distribution featuring Caelestia Dots, Btrfs, Snapper, and Hyprland.

## Features

- **Desktop**: Hyprland Wayland compositor
- **Dotfiles**: Full Caelestia Dots with custom branding
- **Filesystem**: Btrfs with Snapper snapshots
- **Boot**: GRUB with custom splash screen
- **Installer**: Zenity-based GUI installer (English)
- **Tools**: Fastfetch, Kitty, Pipewire, and more

## Download

[Download ISO from Google Drive](https://drive.google.com/file/d/1ZYwVVHgwy97ZcewSAvl791jOW6QBCTYk/view?usp=sharing) (2.1 GB)

> **Note**: The download link has viewer permissions. You can make a copy to your own Drive.

## Installation

1. Boot from USB with the ISO file
2. Open terminal and run:
   ```bash
   sudo gayos-install
   ```
3. Follow the installer prompts (in English):
   - Select installation disk
   - Enter hostname (default: `gayos`)
   - Create username (default: `gay`)
   - Set password
4. Wait for installation to complete
5. Reboot and remove the ISO

## Default credentials

- **Username**: As chosen during installation (default: `gay`)
- **Password**: As chosen during installation

## Build from source

```bash
# Clone repository
git clone https://github.com/ln678090/gayos.git
cd gayos

# Build ISO
sudo mkarchiso -v -w ../work -o ../out .
```

## Included packages

- **Base**: base, linux, linux-firmware
- **Desktop**: hyprland, xdg-desktop-portal-hyprland, xdg-desktop-portal-gtk
- **Terminal**: kitty, fastfetch, vim, zsh, fish
- **Login**: greetd, greetd-tuigreet
- **Storage**: btrfs-progs, snapper
- **Audio**: pipewire, pipewire-pulse, wireplumber
- **Network**: NetworkManager, openssh
- **AUR**: paru (AUR helper)
- **Caelestia**: caelestia-cli, caelestia-shell, full Dots

## System requirements

- **RAM**: 4GB minimum (8GB recommended)
- **Storage**: 20GB minimum (SSD recommended)
- **Boot**: UEFI or BIOS
- **GPU**: Any modern GPU with Wayland support

## Screenshots

Coming soon!

## Support

- **Discord**: [Caelestia Discord](https://discord.gg/BGDCFCmMBk)
- **Issues**: [GitHub Issues](https://github.com/ln678090/gayos/issues)

## Credits

- [Arch Linux](https://archlinux.org)
- [Caelestia](https://caelestia.gg)
- [Hyprland](https://hyprland.org)

## License

GayOS uses packages from Arch Linux and AUR. See individual package licenses for details.
