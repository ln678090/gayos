#!/usr/bin/env bash

set -euo pipefail

user="gay"

if ! id "$user" >/dev/null 2>&1; then
    useradd -m \
        -G wheel,audio,video,input,network \
        -s /bin/zsh \
        "$user"
fi

install -d -o "$user" -g "$user" -m 0755 "/home/$user/.config"

if [[ -d /etc/skel/.config ]]; then
    cp -a /etc/skel/.config/. "/home/$user/.config/"
fi

chown -R "$user:$user" "/home/$user/.config"

install -d -m 0755 /etc/sudoers.d
cat > /etc/sudoers.d/99-gay-live <<'SUDOERS'
gay ALL=(ALL) NOPASSWD: ALL
SUDOERS
chmod 0440 /etc/sudoers.d/99-gay-live

systemctl enable NetworkManager.service
systemctl enable greetd.service
systemctl set-default graphical.target
