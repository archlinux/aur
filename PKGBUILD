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
conflicts=('tmpltr' 'byteowlz-tmpltr')
source=("tmpltr-${pkgver}.tar.gz::https://github.com/byteowlz/tmpltr/releases/download/v${pkgver}/tmpltr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a3d28b3428916257bf28e01431a5bcadeb7780941e58f49e7d60664bcf63ac47')

package() {
    install -Dm755 tmpltr "$pkgdir/usr/bin/tmpltr"
}
