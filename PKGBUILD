pkgname=timer-rs-bin
_pkgname=timer
pkgver=0.7.3
pkgrel=1
pkgdesc="Simple countdown terminal alarm. Useful for pomodoros too. Git release binary"
arch=('x86_64')
url="https://github.com/pando85/timer"
license=('GPL-3.0-only')
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
sha256sums=('9717f8934db0ab630cb0df0f4ee947a1bffa30aa3b5da3a66932a03773a395b1')

prepare() {
  cd "${srcdir}"
  tar -xf "$_source"
}

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
