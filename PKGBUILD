# Maintainer: byteowlz <dev@byteowlz.com>
pkgname=tmpltr-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Template-based document generation CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/tmpltr"
license=('MIT')
provides=('tmpltr')
conflicts=('tmpltr' 'byteowlz-tmpltr')
depends=('typst')
source_x86_64=("tmpltr-bin-0.3.2-x86_64.tar.gz::https://github.com/byteowlz/tmpltr/releases/download/v0.3.2/tmpltr-v0.3.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4adb6f828fd8cda9f1a5796491a77f52405ec64818021a04bf5dca64ac52c937')
source_aarch64=("tmpltr-bin-0.3.2-aarch64.tar.gz::https://github.com/byteowlz/tmpltr/releases/download/v0.3.2/tmpltr-v0.3.2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('fd9ddbb31b1baf6f155bd67795e881d75c58e870961e201cac4722b51222cac0')

package() {
    cd "$srcdir"
    install -Dm755 */bin/tmpltr "$pkgdir/usr/bin/tmpltr"
}
