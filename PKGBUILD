# Maintainer: Tommy Falkowski <hello@byteowlz.com>
pkgname=tmpltr-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Template-based document generation CLI"
arch=('x86_64')
url="https://github.com/byteowlz/tmpltr"
license=('MIT')
depends=('typst')
provides=('tmpltr')
conflicts=('tmpltr')
source=("tmpltr-${pkgver}.tar.gz::https://github.com/byteowlz/tmpltr/releases/download/v${pkgver}/tmpltr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('95d5b5a380a942774895715f4cae584677abfd5a1bd211e1301fd01c9f33dce4')

package() {
    install -Dm755 tmpltr "$pkgdir/usr/bin/tmpltr"
}
