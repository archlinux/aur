# Maintainer: Dennis Lichtenthaeler <gamy@mrgamy.space>
# Contributor: Georgi Manov <lobo1@abv.bg>
pkgname=norwester-otf
pkgver=1.3.1
pkgrel=1
pkgdesc="A condensed geometric sans serif with uppercase, small caps,
numbers & an assortment of symbols. By Jamie Wilson."
arch=(any)
url="https://jamiewilson.github.io/norwester/"
license=('SIL')
provides=('norwester.otf')
source=("https://jamiewilson.github.io/norwester/assets/norwester.zip")
md5sums=('6dbd8a89e9db2b9b646e57959db38689')

package() {

	install -dm755 "$pkgdir/usr/share/fonts/norwester"

	install -m644 norwester-v1.2/norwester.otf "$pkgdir/usr/share/fonts/norwester/norwester.otf"

	install -Dm644 norwester-v1.2/OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
