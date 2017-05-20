# Maintainer: Monsieur Tino <waste@mrtino.eu>

pkgname=gilbert
pkgver=1.004
pkgrel=1
pkgdesc="Font made in tribute of Gilbert Baker, creator of the Rainbow Flag. Only one of the two version of this font is available because this one is compatible system-wide."
url="https://www.typewithpride.com/"
arch=(any)
license=('Creative Commons BY-SA')
source=("https://github.com/Fontself/TypeWithPride/archive/$pkgver.tar.gz")
sha512sums=('27ed739e202a89db64305213184d93775f404160cefa18e4d9e35a682fd8cabfb63a417d31dcb3dcf2c3f9242fea3717be23bc24f25617102917cea2aebfcb11')
install=gilbert.install

package() {
    cd TypeWithPride-$pkgver
    install -d "$pkgdir/usr/share/fonts/gilbert"
    install -t "$pkgdir/usr/share/fonts/gilbert" -m644 fonts/Gilbert-Bold-Preview_1003.otf
}

# vim:set ts=2 sw=2 et:
