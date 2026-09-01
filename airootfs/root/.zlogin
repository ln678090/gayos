# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

~/.automated_script.sh

if [[ -o interactive ]] && command -v gayos-welcome >/dev/null 2>&1; then
    gayos-welcome
fi
