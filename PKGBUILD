pkgname=timer-rs-bin
_pkgname=timer
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple countdown terminal alarm. Useful for pomodoros too. Git release binary"
arch=('x86_64')
url="https://github.com/pando85/timer"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('timer')
conflicts=(timer-rs-git)
replaces=()
backup=()
options=()
install=
changelog=
_urlprefix="https://github.com/pando85/${_pkgname}/releases/download/v${pkgver}"
_source="${_pkgname}-${pkgver}-${arch}-unknown-linux-gnu.tar.gz"
source=(${_urlprefix}/${_source})
noextract=()
sha256sums=('ba9174643bf33757d5df93c8aecded59552941100eb46c243059283c7891d1e8')

prepare() {
  cd "${srcdir}"
  tar -xf "$_source"
}

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
