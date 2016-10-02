pkgname="urxvt-bidi"
pkgver=2.11
pkgrel=1
pkgdesc="Extension for adding bidirectional support to urxvt"
url="https://metacpan.org/pod/distribution/Text-Bidi/misc/bidi"
arch=('any')
license=('GPL')
depends=('rxvt-unicode' 'perl-text-bidi')
makedepends=()
source=("https://api.metacpan.org/source/KAMENSKY/Text-Bidi-$pkgver/misc/bidi")
install="$pkgname.install"
md5sums=('c34e22c25f46048427e7fd973c843547')

package() {
    install -Dm644 $srcdir/bidi "$pkgdir"/usr/lib/urxvt/perl/bidi
}
