# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=steam-native-webhelper
pkgver=20190821
pkgrel=1
pkgdesc="hack to make steamwebhelper behave"
license=(BSD)
arch=(any)

depends=(steam-native-runtime)

source=(
	steam-native-webhelper
)

sha512sums=('606ee8e5a85252c392ac14d1033574ff911b22db84b0bc397ca9b960dd7427445ed12985ca7786f6178f1c6eb650798d3b6bf43be8540aceff8d13329b2ac411')

package() {
	install -m 755 -D "steam-native-webhelper" "$pkgdir/usr/bin/steam-native-webhelper"
}
