# Maintainer: Monsieur Tino <waste@mrtino.eu>

pkgname=gilbert
pkgver=1.004
pkgrel=3
pkgdesc="Font made in tribute of Gilbert Baker, creator of the Rainbow Flag. Two versions of the font are available, one is compatible system-wide while the other is only compatible with Firefox because it is an OpenType-SVG font."
url="https://www.typewithpride.com/"
arch=(any)
license=('Creative Commons BY-SA')
source=("https://github.com/Fontself/TypeWithPride/archive/$pkgver.tar.gz")
sha512sums=('7e2671935c36ec0eb9a082c47b935b14b97466ebb713f480646c3014337297bb14a8ce1d2bcfebbfff264071e8bf6c71c4dfd77cc9aec8395f2969203b40597b')
install=gilbert.install

package() {
    cd TypeWithPride-$pkgver
    install -d "$pkgdir/usr/share/fonts/gilbert"
    install -t "$pkgdir/usr/share/fonts/gilbert" -m644 fonts/Gilbert\ Bold-Preview_1004.otf
    install -t "$pkgdir/usr/share/fonts/gilbert" -m644 fonts/Gilbert-Color\ Bold-Preview_1004.otf
}

# vim:set ts=2 sw=2 et:
