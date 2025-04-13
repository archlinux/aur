# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="pman"
pkgname="${_pkgname}-helper"
pkgver="1.3.0"
pkgrel="3"
pkgdesc="A pacman helper script, because you forget all the stupid flags"
url="https://git.bjphoster.com/source/${_pkgname}"
arch=("any")
license=("MIT")
depends=("bash" "pacman")
conflicts=("pman") # Another package called `pman` currently exists in the AUR
source=("https://git.bjphoster.com/source/${_pkgname}/archive/${pkgver}.tar.gz")

sha1sums=("458ac1ba88a6d33d634c4a8a8ad38941f6cc38a9")
sha256sums=("75663adb5dab96497af9f312fa67c1d846d9758b4a5c23bd66ee91108e122f0c")
md5sums=("a2cb6720b2b376165d10cb1a5482e069")

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/pman.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
