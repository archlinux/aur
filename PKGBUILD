# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=steam-native-webhelper
pkgver=20190722
pkgrel=1
pkgdesc="hack to make steamwebhelper behave"
license=(BSD)
arch=(any)

depends=(steam-native-runtime)

source=(
	steam-native-webhelper
	steamwebhelper.sh
	steamwebhelper.sh.override.2bf679560fac2ed8
)

sha512sums=(
	'f7f44322e3eb783b97f4348abf443df38a1f6a182f2c10d5174d08f56552bb25ee15f7536f51e45a7765de8b89e1be8d16ae7a8f2ccfb12b754fefa99cf52987'
	'e8d71d8cf88c1720ec93a3f1a6f7cb177e2763c21ee2e1d4e039b7f5fd0e860dc4659fcedef8eb4957016e533fedbe8fc2452c024c0c0c5a8becaa278d52b5e4'
	'ba7b72a7efdf53d10e202f2d652efeccc986910672117810899d2873f13b9b2e3f73c4d3398cb150ff2825dc945b7e95f6d9871156ca980aaa6dc4c81dd1120c'
)

package() {
	install -m 755 -D "steamwebhelper.sh" "$pkgdir/usr/lib/steam/steamwebhelper.sh"
	install -m 755 -D "steam-native-webhelper" "$pkgdir/usr/bin/steam-native-webhelper"
	install -m 755 -D "steamwebhelper.sh.override.2bf679560fac2ed8" "$pkgdir/usr/lib/steam/steamwebhelper.sh.override.2bf679560fac2ed8"
}
