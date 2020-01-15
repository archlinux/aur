# Maintainer:  Althorion <althorion@protonmail.com>

pkgname=ttf-jetbrains-mono
pkgver=1.0.0
pkgrel=1
url="https://www.jetbrains.com/lp/mono/"
pkgdesc="JetBrain’s free and open source typeface for developers"
arch=('any')
source=("https://download.jetbrains.com/fonts/JetBrainsMono-${pkgver}.zip")
license=("Apache 2.0")
b2sums=('66067752bdabd173dbc3e0143483948ae94a4e67ec93579588f555c9e36fbdf6dfd6627fba8c8acdd976e76c4d23d0760953ed33ab4d6ba9d497aa06de70173b')
sha256sums=('82bf0dec956e4ca9afa4da4978fa5de80a75a576b3353d570ccbaabe4e858389')

package() {
	mkdir -p $pkgdir/usr/share/fonts/${pkgname}
	install -Dm 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/${pkgname}/
}

