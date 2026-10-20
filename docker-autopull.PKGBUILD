# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
source PKGBUILD
pkgname=skywire-docker-autopull
pkgdesc="Skywire Docker deployment auto-updater: pulls the latest image and recreates the containers using it"
arch=('any')
depends=('docker' 'docker-compose')
optdepends=('skywire-bin: for skywire.conf configuration')
license=('license-free')
# Clear inherited sources
unset source_x86_64 source_i686 source_aarch64 source_armv8 source_arm source_armv7 source_armv7l source_armv7h source_riscv64
unset sha256sums_x86_64 sha256sums_i686 sha256sums_aarch64 sha256sums_armv8 sha256sums_arm sha256sums_armv7 sha256sums_armv7l sha256sums_armv7h
unset backup _source _desktop _icon _service _script _binarchive _release_url _binaryscript _appscript install
unset provides conflicts
build() { true; }
_scripts=("docker-autopull.sh")
_services=("docker-autopull.service")
_timers=("docker-autopull.timer")
source=("${_scripts[@]}" "${_services[@]}" "${_timers[@]}")
sha256sums=('4bb6689e9ef2d11048536cdfe278d7d1e6c035e37bfecbc5617a59a038cca662'
            '22c40f57c7ecd3f34758abc89d34164e6e1836d663c34692b2f2938b00cccb71'
            'db7f0de63785507c4e67f0037ef44ca6be00e0b123cc1ac156d52e45c6f867e9')

package() {
  _systemddir="usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/${_systemddir}"

  install -Dm755 "${srcdir}/docker-autopull.sh" "${pkgdir}/usr/bin/skywire-docker-autopull"

  install -Dm644 "${srcdir}/docker-autopull.service" "${pkgdir}/${_systemddir}/skywire-docker-autopull.service"
  install -Dm644 "${srcdir}/docker-autopull.timer" "${pkgdir}/${_systemddir}/skywire-docker-autopull.timer"
}
