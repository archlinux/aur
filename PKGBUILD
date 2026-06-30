# Maintainer: Tommy Falkowski <hello@byteowlz.com>
pkgname=tmpltr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Template-based document generation CLI"
arch=('x86_64')
url="https://github.com/byteowlz/tmpltr"
license=('MIT')
depends=('typst')
provides=('tmpltr')
conflicts=('tmpltr' 'byteowlz-tmpltr')
source=("tmpltr-${pkgver}.tar.gz::https://github.com/byteowlz/tmpltr/releases/download/v${pkgver}/tmpltr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('26e8882bddbef2a1803f20e9a913f06815daa1bda80e3d6c6f9f54addbc694a0')

package() {
    install -Dm755 tmpltr "$pkgdir/usr/bin/tmpltr"
}
