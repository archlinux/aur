# Maintainer: Beyley Thomas <ep1cm1n10n123@gmail.com>
pkgname=lib32-libbass
pkgver=2.4.18
pkgrel=1
pkgdesc="BASS audio library (32-bit)"
arch=(x86_64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib)
source=(https://www.un4seen.com/files/bass24-linux.zip LICENSE.bass)
sha256sums=('d15ce4b0bc98a9e1c9e5a108607ae891287b5951327fb0b55692f2ea40d3772a'
            'f7bc36320110c8fd2f87c6d2bb5df6d2231ca9ab31a299b1565de63f7681cc83')

package () {
    install -D -m644 "$startdir/LICENSE.bass" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 "$srcdir/libs/x86/libbass.so" "$pkgdir/usr/lib32/libbass.so"
}
