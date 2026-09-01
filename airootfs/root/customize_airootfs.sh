#!/usr/bin/env bash
set -euo pipefail

user="gay"
home="/home/$user"

# Create the Live user. The home may already exist because it is supplied
# by airootfs, so useradd may skip copying /etc/skel; that is intentional.
if ! id "$user" >/dev/null 2>&1; then
  useradd -m \
    -G wheel,audio,video,input,network \
    -s /bin/zsh \
    "$user"
fi

# Ensure required per-user directories exist and belong to the Live user.
# This fixes Kitty/Fontconfig cache errors and GayOS script .local errors.
install -d -o "$user" -g "$user" -m 0755 "$home"
install -d -o "$user" -g "$user" -m 0755 "$home/.cache"
install -d -o "$user" -g "$user" -m 0755 "$home/.config"
install -d -o "$user" -g "$user" -m 0755 "$home/.local"

# Copy Hyprland and other config templates provided by the ISO.
if [[ -d /etc/skel/.config ]]; then
  cp -a /etc/skel/.config/. "$home/.config/"
fi

# airootfs files are commonly owned by root during the build.
# Make every file in the Live user's home writable by gay.
chown -R "$user:$user" "$home"

# Passwordless sudo is normal for this Live environment.
install -d -m 0755 /etc/sudoers.d
cat > /etc/sudoers.d/99-gay-live <<'SUDOERS'
gay ALL=(ALL) NOPASSWD: ALL
SUDOERS
chmod 0440 /etc/sudoers.d/99-gay-live

# Enable the graphical Live session and networking.
systemctl enable NetworkManager.service
systemctl enable greetd.service
systemctl set-default graphical.target

exit 0
