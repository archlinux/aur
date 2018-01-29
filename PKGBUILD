# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname="urxvt-bidi"
pkgver=2.12
pkgrel=1
pkgdesc="Extension for adding bidirectional support to urxvt"
url="https://metacpan.org/pod/distribution/Text-Bidi/misc/bidi"
arch=('any')
license=('GPL')
depends=('rxvt-unicode' 'perl-text-bidi')
makedepends=()
source=("https://fastapi.metacpan.org/source/KAMENSKY/Text-Bidi-$pkgver/misc/bidi")
install="$pkgname.install"
md5sums=('bdc8cb27b622692382f3a7a0ebacf4ef')

package() {
    install -Dm644 $srcdir/bidi "$pkgdir"/usr/lib/urxvt/perl/bidi
}
