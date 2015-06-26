# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
name=wapiti
pkgname=$name-crf
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple and fast discriminative sequence labelling toolkit"
arch=(i686 x86_64)
url="http://wapiti.limsi.fr/"
license=('BSD')
_titlized_name=Wapiti
source=(https://github.com/Jekub/$_titlized_name/archive/v$pkgver.tar.gz)
md5sums=(a3f23654d1f8a84a91f72002ec56631a)

build() {
    cd "$srcdir/$_titlized_name-$pkgver"
    make
}

package() {
    cd "$srcdir/$_titlized_name-$pkgver"
    make PREFIX="usr/" DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
