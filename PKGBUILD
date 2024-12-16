# Maintainer: eltonff <https://github.com/eltonfabricio10/>
pkgname=relagit-bin
pkgver=0.16.8
pkgrel=1
pkgdesc="Take back control over your git workflow."
arch=("x86_64")
url="https://github.com/relagit/relagit"
license=("GNU Lesser General Public License v3.0")
provides=("RelaGit")
depends=("gtk3"
         "libnotify"
         "nss"
         "libxss"
         "libxtst"
         "xdg-utils"
         "at-spi2-core"
         "util-linux-libs"
         "libsecret")
optdepends=("libappindicator-gtk3")
source_x86_64=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver}/${provides}-linux.deb")
sha256sums_x86_64=('d6743e0de9d67ccb745802b33e75967f47bac88c43cf1cda62566a4248376391')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
