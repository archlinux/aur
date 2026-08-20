# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
source PKGBUILD
# Clear inherited arch-specific sources/checksums and build function
unset source_x86_64 source_i686 source_aarch64 source_armv8 source_arm source_armv7 source_armv7l source_armv7h source_riscv64
unset sha256sums_x86_64 sha256sums_i686 sha256sums_aarch64 sha256sums_armv8 sha256sums_arm sha256sums_armv7 sha256sums_armv7l sha256sums_armv7h
unset backup _source _desktop _icon _service _script _binarchive _release_url _binaryscript _appscript
unset provides conflicts
build() { true; }
pkgname=skywire-autoupdate
pkgdesc="Skywire auto-updater: compiles latest CI-tested commit daily and updates docker deployments"
arch=('any')
depends=('skywire-bin' 'go>=1.21' 'curl' 'zstd')
optdepends=('docker: required for skywire-docker-update'
'docker-compose: required for skywire-docker-update')
license=('license-free')
install=skywire-autoupdate.install
_scripts=("skywire-update" "skywire-docker-update")
_services=("skywire-update.service" "skywire-docker-update.service")
_timers=("skywire-update.timer" "skywire-docker-update.timer")
source=("${_scripts[@]}" "${_services[@]}" "${_timers[@]}")
sha256sums=('de643c85a850e71c6f2237bcc9539312a62c23bd816eaea3a806187e9542d98d'
            '56a9ef48e2b4012dcfab02ef01cee5e8b92af116c5c711a27ca3dcde702ae0ea'
            '2623526259755c4979fa7eefdbc0dee74cad7b4526735a14de608dafb4fe274d'
            '45c5cdd73839e6eae9fbda46377a5447353f315821de4707a004de1c52099b80'
            '8b37eeb9ef5b2b8b7d1057d5d6e95056f7324cb4d2ac237735b7122c97c1a7fd'
            'cc6fc91077d85643250b6c76c560e6ecf1ec9f1e677576e08998289bad2b2c94')

package() {
  _systemddir="usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/${_systemddir}"

  for _s in "${_scripts[@]}"; do
    install -Dm755 "${srcdir}/${_s}" "${pkgdir}/usr/bin/${_s}"
  done

  for _s in "${_services[@]}"; do
    install -Dm644 "${srcdir}/${_s}" "${pkgdir}/${_systemddir}/${_s}"
  done

  for _s in "${_timers[@]}"; do
    install -Dm644 "${srcdir}/${_s}" "${pkgdir}/${_systemddir}/${_s}"
  done
}
