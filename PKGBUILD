# Maintainer: Rushikesh Jogdand <jogdand at pm dot me>
pkgname=jetbrains-mono-fonts
_pkgname=JetBrainsMono
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A free and open source typeface for developers"
arch=('any')
url="https://download.jetbrains.com/fonts"
license=('Apache')
source=("$url/$_pkgname-$pkgver.zip")
md5sums=('1083f3f5315a564fb59d571da5c3b624')

package() {
	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
}
