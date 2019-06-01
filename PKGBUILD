# Maintainer: Leia <waste@mrtino.eu>

pkgname=gilbert
pkgver=1.005
pkgrel=1
pkgdesc="Font made in tribute of Gilbert Baker, creator of the Rainbow Flag. Two versions of the font are available, one is compatible system-wide while the other is only compatible with Firefox because it is an OpenType-SVG font."
url="https://www.typewithpride.com/"
arch=(any)
license=('Creative Commons BY-SA')
source=("https://github.com/Fontself/TypeWithPride/archive/$pkgver.tar.gz")
sha512sums=('50c0f920b1b68d4051862f0988217a49eea0b40dddba043bf0fd7feb15a6c0bacf12d70ebf77296676f5d9919b8b0d84c10da54db15838e77f62fd8f9845cb28')
install=gilbert.install

package() {
    cd TypeWithPride-$pkgver
    install -d "$pkgdir/usr/share/fonts/gilbert"
    install -t "$pkgdir/usr/share/fonts/gilbert" -m644 fonts/Gilbert-Bold\ Preview_1005.otf
    install -t "$pkgdir/usr/share/fonts/gilbert" -m644 fonts/Gilbert-Color\ Bold\ Preview_1005.otf
}

# vim:set ts=2 sw=2 et:
