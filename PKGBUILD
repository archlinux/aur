# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=steam-native-webhelper
pkgver=20190419
pkgrel=1
pkgdesc="hack to make steamwebhelper behave"
license=(BSD)
arch=(any)

depends=(steam-native-runtime)

source=(
	steam-native-webhelper
	steamwebhelper.sh
	steamwebhelper.sh.override
)

sha512sums=(
	'6648380ec91664f49b33422e45cc952be50532759b5eab0cc10733d535c4d659e82a6f0dc6f32fd3906bf04e10e7adeaa8cc377eda011c39258c1c202c40fc56'
	'd917d0b7f1666cc899e5d2e7765fbe532f7c679dec4b24fc35b7fb6954a714b93c32e7e58fd3c58f2b21278f117ef5b08774d4258dab726405528c3c9375e1bf'
	'238c955f4b1e1157998af1f4c91f51adc6d0c71a5ca4a1494d11b7e881dabd336f0363310bde7256b5bfc8a520d4c2adbf30ffcab4fb8291875700fb4071e7fb'
)

package() {
	install -m 755 -D "steamwebhelper.sh"          "$pkgdir/usr/lib/steam/steamwebhelper.sh"
	install -m 755 -D "steamwebhelper.sh.override" "$pkgdir/usr/lib/steam/steamwebhelper.sh.override"
	install -m 755 -D "steam-native-webhelper"     "$pkgdir/usr/bin/steam-native-webhelper"
}
