#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="gayos"
iso_label="GAYOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="GayOS Project"
iso_application="GayOS Live ISO"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="gayos"

buildmodes=('iso')

bootmodes=('bios.syslinux'
  'uefi.systemd-boot')

pacman_conf="pacman.conf"

airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')

bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
airootfs_postprocess_script="airootfs/root/customize_airootfs.sh"
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"

  ["/usr/local/lib/gayos/initialize-live-user"]="0:0:755"
  ["/usr/local/bin/start-gayos-hyprland"]="0:0:755"
  ["/usr/local/bin/gayos-welcome"]="0:0:755"
  ["/usr/local/bin/gayos-first-run"]="0:0:755"
  ["/usr/local/bin/gayos-install-caelestia"]="0:0:755"
  ["/usr/local/bin/gayos-install"]="0:0:755"
)
