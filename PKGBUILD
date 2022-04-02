# Maintainer: Shuyuan Liu <liu_shuyuan at qq dot com>

pkgname=myriacat
pkgver=1.2
pkgrel=2
pkgdesc='Linux audio spectrum analyzer with VLF SDR'
arch=('x86_64')
url='https://github.com/myriacat/myriacat'
license=('custom')

depends=()
source=("https://github.com/myriacat/myriacat/releases/download/v1.2/${pkgname}_${pkgver}.tar.gz")
sha256sums=('76553279c6d0c6f5300a925b3b9eff463e61998d369414c16bda6eb64b25c8cb')

package() {
    cd "$srcdir"
    install -Dm755 myriacat "$pkgdir/usr/bin/myriacat"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
