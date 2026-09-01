#!/usr/bin/env bash

image="/usr/share/gayos/logo.png"

clear

if command -v chafa >/dev/null 2>&1 && [[ -f "$image" ]]; then
    chafa \
        --format symbols \
        --colors full \
        --symbols braille \
        --size 60x18 \
        --align center \
        --fg-only \
        --bg '#1e1e2e' \
        --threshold 0.7 \
        "$image"
else
    printf '\n\tWelcome to GayOS\n'
fi

printf '\n'

fastfetch --logo none
