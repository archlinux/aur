# Maintainer: Tom Carrio <tom@carrio.dev>
pkgname=ttf-jetbrains-mono-git
pkgver=1.0.4
_projectname=JetBrainsMono
pkgrel=1
epoch=
pkgdesc="A typeface for developers_"
arch=('any')
url="https://www.jetbrains.com/lp/mono/"
license=('Apache-2.0')
provides=(ttf-jetbrains-mono)
conflicts=(ttf-jetbrains-mono)
install=
changelog=
source=(git+https://github.com/JetBrains/$_projectname.git)
md5sums=('SKIP')

package() {
	cd "$srcdir/$_projectname/ttf"
  install -d "$pkgdir/usr/share/fonts/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 ./*.ttf
}