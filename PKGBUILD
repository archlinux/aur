# Maintainer: eltonff <https://github.com/eltonfabricio10/>
pkgname=relagit-bin
pkgver=0.16.9
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
sha256sums_x86_64=('1fb4324aed3abc06e63a2e5f0f496d760b58daa3205e17a6ba9ba75b46128e51')

prepare() {
  bsdtar xf data.tar.xz
}

package() {
  mv opt "$pkgdir"
  mv usr "$pkgdir"
}
