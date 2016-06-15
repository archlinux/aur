# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname=acccheck
pkgver=0.2.1
pkgrel=1
pkgdesc="A password dictionary attack tool that targets windows authentication via the SMB protocol"
arch=(any)
url="https://labs.portcullis.co.uk/tools/acccheck/"
license=('GPL')
depends=(perl)
source=("https://labs.portcullis.co.uk/download/acccheck-0-2-1.tar.gz")
md5sums=(ad14f58e04bc683fce5f72ef3cdb745d)

package() {
            cd "$srcdir"/acccheck-0-2-1
            install -dm755 "$pkgdir"/usr/share/"$pkgname"/
            install -dm755 "$pkgdir"/usr/bin/
            install -dm755 "$pkgdir"/usr/share/licenses/"$pkgname"/
            cp acccheck.pl "$pkgdir"/usr/share/"$pkgname"/
            cp COPYING.GPL "$pkgdir"/usr/share/licenses/"$pkgname"/
            cp COPYING.ACCCHECK "$pkgdir"/usr/share/licenses/"$pkgname"/
            cp README.TXT "$pkgdir"/usr/share/licenses/"$pkgname"/
            chmod +x "$pkgdir"/usr/share/"$pkgname"/acccheck.pl
            ln -s /usr/share/"$pkgname"/acccheck.pl "$pkgdir"/usr/bin/"$pkgname"
}
