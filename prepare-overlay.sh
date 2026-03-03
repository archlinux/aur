#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <upstream_source_dir> <overlay_output_dir>" >&2
    exit 1
fi

src_dir="$1"
out_dir="$2"

wrapper_src="$src_dir/fido2-manage.sh"
gui_src="$src_dir/gui.py"

if [[ ! -f "$wrapper_src" ]]; then
    echo "Missing wrapper source: $wrapper_src" >&2
    exit 1
fi
if [[ ! -f "$gui_src" ]]; then
    echo "Missing GUI source: $gui_src" >&2
    exit 1
fi

rm -rf "$out_dir"
mkdir -p "$out_dir"

wrapper_out="$out_dir/fido2-manage"
{
    head -n 1 "$wrapper_src"
    cat <<'BLOCK'

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ -n "${FIDO2_TOKEN_CMD:-}" ]]; then
    :
elif [[ -x "${SCRIPT_DIR}/fido2-token2" ]]; then
    FIDO2_TOKEN_CMD="${SCRIPT_DIR}/fido2-token2"
elif command -v fido2-token2 >/dev/null 2>&1; then
    FIDO2_TOKEN_CMD="$(command -v fido2-token2)"
else
    echo "[Error] Unable to locate fido2-token2. Set FIDO2_TOKEN_CMD or install fido2-token2 in PATH." >&2
    exit 1
fi

BLOCK
    tail -n +2 "$wrapper_src" | sed '/^FIDO2_TOKEN_CMD=/d'
} > "$wrapper_out"

sed -i 's#\./fido2-manage\.sh#fido2-manage#g' "$wrapper_out"
chmod 755 "$wrapper_out"

gui_out="$out_dir/gui.py"
cp "$gui_src" "$gui_out"
sed -i 's#^FIDO_COMMAND = "\./fido2-manage.sh"#FIDO_COMMAND = os.environ.get("FIDO_MANAGE_CMD", "/usr/bin/fido2-manage")#' "$gui_out"

cat > "$out_dir/fido2-manage-gui" <<'LAUNCHER'
#!/usr/bin/env bash
set -euo pipefail

exec /usr/bin/python3 /usr/share/fido2-manage/gui.py "$@"
LAUNCHER
chmod 755 "$out_dir/fido2-manage-gui"

cat > "$out_dir/69-fido2-token2.rules" <<'RULES'
# Derived from upstream fido2-manage udev data (fido2-manage/udev/fidodevs).
# Arch-safe variant: no plugdev group dependency.
ACTION!="add|change", GOTO="fido2_token2_end"

# TOKEN2 and Hypersecu vendor IDs used by TOKEN2 devices.
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="349e", TAG+="uaccess", MODE="0660"
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2ccf", TAG+="uaccess", MODE="0660"

LABEL="fido2_token2_end"
RULES
