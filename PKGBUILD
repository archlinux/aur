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

sha1sums=("5cd50a98e40cf26b887cc93bf4919b5278d3218a")
sha256sums=("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
md5sums=("235271ded1d7bfa950347954169d0ee6")

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/pman.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
