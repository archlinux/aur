#!/usr/bin/env bash
set -euo pipefail

pkgname=emeditor-wine
pkgver=26.1.1
msi="/usr/share/${pkgname}/emed64_${pkgver}.msi"

prefix="${EMEDITOR_WINEPREFIX:-${HOME}/.wine-emeditor}"
app="${prefix}/drive_c/users/${USER}/AppData/Local/Programs/EmEditor/EmEditor.exe"
ui_font="${EMEDITOR_WINE_UI_FONT:-Noto Sans CJK SC}"
lang="${EMEDITOR_WINE_LANG:-zh_CN.utf8}"

pick_dpi() {
  if [[ -n "${EMEDITOR_WINE_DPI:-}" ]]; then
    printf '%s\n' "${EMEDITOR_WINE_DPI}"
    return
  fi

  local xft line width pxw mmw phys dpi
  xft="$(xrdb -query 2>/dev/null | awk '$1 == "Xft.dpi:" {print int($2 + 0.5); exit}')"
  line="$(xrandr --listmonitors 2>/dev/null | awk 'NR == 2 {print $0}')"
  width="$(printf '%s\n' "${line}" | sed -n 's/.* \([0-9][0-9]*\)\/\([0-9][0-9]*\)x.*/\1 \2/p')"
  pxw="${width%% *}"
  mmw="${width##* }"
  phys=0

  if [[ "${pxw}" =~ ^[0-9]+$ && "${mmw}" =~ ^[0-9]+$ && "${mmw}" -gt 0 ]]; then
    phys="$(( (pxw * 254 + mmw * 5) / (mmw * 10) ))"
  fi

  dpi="${xft:-96}"
  if [[ "${phys}" -gt "${dpi}" ]]; then
    dpi="${phys}"
  fi

  if [[ "${pxw}" =~ ^[0-9]+$ && "${pxw}" -ge 3800 && "${dpi}" -lt 192 ]]; then
    dpi=192
  elif [[ "${dpi}" -ge 220 ]]; then
    dpi=240
  elif [[ "${dpi}" -ge 170 ]]; then
    dpi=192
  elif [[ "${dpi}" -ge 130 ]]; then
    dpi=168
  else
    dpi=120
  fi

  printf '%s\n' "${dpi}"
}

hex_utf16le() {
  printf '%s' "$1" | iconv -f UTF-8 -t UTF-16LE | od -An -tx1 -v | tr -d ' \n'
}

zero_hex() {
  local bytes="$1"
  local out=""
  while ((bytes > 0)); do
    out="${out}00"
    bytes=$((bytes - 1))
  done
  printf '%s' "${out}"
}

set_logfont() {
  local value="$1"
  local height="$2"
  local facehex padchars padhex common fonthex

  facehex="$(hex_utf16le "${ui_font}")"
  padchars=$((32 - ${#ui_font}))
  if ((padchars < 0)); then
    padchars=0
  fi
  padhex="$(zero_hex $((padchars * 2)))"
  common="000000000000000000000000900100000000008600000000${facehex}${padhex}"
  fonthex="${height}${common}"
  wine reg add 'HKCU\Control Panel\Desktop\WindowMetrics' /v "${value}" /t REG_BINARY /d "${fonthex}" /f >/dev/null
}

configure_prefix() {
  local dpi="$1"

  wine reg add 'HKCU\Software\EmSoft\EmEditor v3\Common' /v UseDirectWrite /t REG_DWORD /d 0 /f >/dev/null
  wine reg add 'HKCU\Software\Wine\X11 Driver' /v Decorated /t REG_SZ /d N /f >/dev/null
  wine reg add 'HKCU\Software\Wine\X11 Driver' /v Managed /t REG_SZ /d Y /f >/dev/null
  wine reg add 'HKCU\Control Panel\Desktop' /v LogPixels /t REG_DWORD /d "${dpi}" /f >/dev/null
  wine reg add 'HKCU\Control Panel\Desktop' /v AppliedDPI /t REG_DWORD /d "${dpi}" /f >/dev/null
  wine reg add 'HKCU\Control Panel\Desktop' /v Win8DpiScaling /t REG_DWORD /d 1 /f >/dev/null
  wine reg add 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\FontSubstitutes' /v 'MS Shell Dlg' /t REG_SZ /d "${ui_font}" /f >/dev/null
  wine reg add 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\FontSubstitutes' /v 'MS Shell Dlg 2' /t REG_SZ /d "${ui_font}" /f >/dev/null

  set_logfont MenuFont 08000000
  set_logfont MessageFont 08000000
  set_logfont StatusFont 08000000
  set_logfont IconFont 08000000
  set_logfont SmCaptionFont 08000000
  set_logfont CaptionFont 0a000000
}

install_emeditor() {
  if [[ ! -f "${msi}" ]]; then
    printf 'missing installer: %s\n' "${msi}" >&2
    exit 1
  fi

  mkdir -p "${prefix}"
  wine msiexec /i "${msi}" /qn
  wineserver -w || true
  wineserver -k || true
}

font_file_sources() {
  if [[ -n "${EMEDITOR_WINE_FONTS_DIR:-}" ]]; then
    tr ':' '\n' <<<"${EMEDITOR_WINE_FONTS_DIR}"
  fi

  printf '%s\n' \
    "${HOME}/.wine-emeditor-fonts" \
    "${HOME}/.wine-emeditor-step/drive_c/windows/Fonts" \
    "${HOME}/.wine/drive_c/windows/Fonts" \
    "${HOME}/.local/share/fonts" \
    "/usr/share/fonts"
}

copy_optional_font() {
  local filename="$1"
  local source found

  while IFS= read -r source; do
    [[ -d "${source}" ]] || continue
    found="$(find "${source}" -iname "${filename}" -type f -print -quit 2>/dev/null || true)"
    if [[ -n "${found}" ]]; then
      install -Dm644 "${found}" "${prefix}/drive_c/windows/Fonts/${filename}"
      return 0
    fi
  done < <(font_file_sources)

  return 1
}

register_font_if_present() {
  local filename="$1"
  local name="$2"

  if [[ -f "${prefix}/drive_c/windows/Fonts/${filename}" ]]; then
    wine reg add 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\Fonts' \
      /v "${name}" /t REG_SZ /d "${filename}" /f >/dev/null
  fi
}

import_optional_fonts() {
  local font

  mkdir -p "${prefix}/drive_c/windows/Fonts"

  for font in \
    segmdl2.ttf \
    SegoeIcons.ttf \
    segoeui.ttf \
    segoeuib.ttf \
    segoeuisl.ttf \
    segoeuiz.ttf \
    msyh.ttc \
    msyhbd.ttc \
    msyhl.ttc; do
    [[ -f "${prefix}/drive_c/windows/Fonts/${font}" ]] || copy_optional_font "${font}" || true
  done

  register_font_if_present segmdl2.ttf 'Segoe MDL2 Assets (TrueType)'
  register_font_if_present SegoeIcons.ttf 'Segoe Fluent Icons (TrueType)'
  register_font_if_present segoeui.ttf 'Segoe UI (TrueType)'
  register_font_if_present segoeuib.ttf 'Segoe UI Bold (TrueType)'
  register_font_if_present segoeuisl.ttf 'Segoe UI Semilight (TrueType)'
  register_font_if_present segoeuiz.ttf 'Segoe UI Bold Italic (TrueType)'
  register_font_if_present msyh.ttc 'Microsoft YaHei UI (TrueType)'
  register_font_if_present msyhbd.ttc 'Microsoft YaHei UI Bold (TrueType)'
  register_font_if_present msyhl.ttc 'Microsoft YaHei UI Light (TrueType)'

  if [[ -z "${EMEDITOR_WINE_UI_FONT:-}" && -f "${prefix}/drive_c/windows/Fonts/msyh.ttc" ]]; then
    ui_font="Microsoft YaHei UI"
  fi
}

sync_desktop_entry() {
  local data_home desktop_dir desktop

  data_home="${XDG_DATA_HOME:-${HOME}/.local/share}"
  desktop_dir="${data_home}/applications/wine/Programs"
  desktop="${desktop_dir}/EmEditor.desktop"

  mkdir -p "${desktop_dir}"
  cat >"${desktop}" <<'EOF'
[Desktop Entry]
Name=EmEditor
Exec=emeditor-wine %F
Type=Application
StartupNotify=true
Comment=Launch EmEditor with the emeditor-wine wrapper
Icon=emeditor-wine
StartupWMClass=emeditor.exe
Categories=Utility;TextEditor;Development;
MimeType=text/plain;
EOF

  if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "${data_home}/applications" >/dev/null 2>&1 || true
  fi
}

export WINEPREFIX="${prefix}"
export LANG="${lang}"
export LC_ALL="${lang}"
export LANGUAGE="${EMEDITOR_WINE_LANGUAGE:-zh_CN:en_US}"

sync_desktop_entry
import_optional_fonts

dpi="$(pick_dpi)"
configure_prefix "${dpi}"

if [[ ! -f "${app}" ]]; then
  install_emeditor
  configure_prefix "${dpi}"
  sync_desktop_entry
fi

args=()
for arg in "$@"; do
  if [[ -e "${arg}" ]]; then
    args+=("$(winepath -w "${arg}")")
  else
    args+=("${arg}")
  fi
done

exec wine "${app}" "${args[@]}"
