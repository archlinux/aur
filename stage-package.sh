#!/usr/bin/env bash
# Shared by makepkg, dpkg-deb and rpmbuild. Input is publish.sh's extracted tarball.
set -euo pipefail

payload="$(realpath "${1:?Usage: stage-package.sh PAYLOAD DESTDIR LICENSE_DIR}")"
dest="$(realpath -m "${2:?Missing DESTDIR}")"
license_dir="${3:?Missing relative LICENSE_DIR}"
case "$license_dir" in
    usr/share/licenses/infopanel|usr/share/licenses/infopanel-bin|usr/share/doc/infopanel) ;;
    *) echo "Unexpected license directory: $license_dir" >&2; exit 1 ;;
esac
[[ "$dest" != / && ! -e "$dest/opt/infopanel" ]]

install -d "$dest/opt/infopanel" "$dest/usr/bin"
cp -a --no-preserve=ownership "$payload/infopanel/." "$dest/opt/infopanel/"
# Publish output may inherit a developer's group-writable umask.
chmod -R u=rwX,go=rX "$dest/opt/infopanel"
find "$dest/opt/infopanel" -type f \( -name '*.dll' -o -name '*.so' -o -name '*.pdb' \) -exec chmod 644 {} +
chmod 755 "$dest/opt/infopanel/infopanel"
ln -s /opt/infopanel/infopanel "$dest/usr/bin/infopanel"
install -Dm644 "$payload/infopanel-udev.rules" "$dest/usr/lib/udev/rules.d/99-infopanel.rules"
install -Dm755 "$payload/infopanel-smart-dump.sh" "$dest/usr/lib/infopanel/infopanel-smart-dump.sh"
install -Dm644 "$payload/infopanel-smart.service" "$dest/usr/lib/systemd/system/infopanel-smart.service"
# Keep the tarball's /usr/local installer unchanged. Adapt the unit only here,
# for all three package managers, and fail if the upstream path changes.
grep -qxF 'ExecStart=/usr/local/lib/infopanel/infopanel-smart-dump.sh' "$payload/infopanel-smart.service"
sed -i 's|^ExecStart=/usr/local/lib/infopanel/|ExecStart=/usr/lib/infopanel/|' \
    "$dest/usr/lib/systemd/system/infopanel-smart.service"
install -Dm644 "$payload/infopanel-smart.timer" "$dest/usr/lib/systemd/system/infopanel-smart.timer"
install -Dm644 "$payload/infopanel.desktop" "$dest/usr/share/applications/infopanel.desktop"
sed -i 's|^Exec=.*|Exec=/opt/infopanel/infopanel|' "$dest/usr/share/applications/infopanel.desktop"
install -Dm644 "$payload/infopanel.png" "$dest/usr/share/icons/hicolor/256x256/apps/infopanel.png"
install -Dm644 "$payload/LICENSE" "$dest/$license_dir/LICENSE"
install -Dm644 "$payload/LICENSES.md" "$dest/$license_dir/LICENSES.md"
