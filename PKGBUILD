# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=steam-native-webhelper
pkgver=20190530
pkgrel=1
pkgdesc="hack to make steamwebhelper behave"
license=(BSD)
arch=(any)

depends=(steam-native-runtime)

source=(
	steam-native-webhelper
	steamwebhelper.sh
	steamwebhelper.sh.override.f60cb3818ca4cb71
	steamwebhelper.sh.override.8625e67eb3a5c5df
)

sha512sums=(
	'ee8ed713289727b0d304459f4ccce349cae37343a68fcfe4314797b52000f514c3933e09531b1dcefb9210fa4695a5a5811b16aa65f0f5f7f9b9f1f2cc06891a'
	'816f6661d574cfbcd7d9fa76cfebe80701450b3357f1b5b92b62cdf8cea6f2bd186f6fb4beecd334523521f97f3e8f9327c0c8c3d8ba16f3a9a29d10640b5e50'
	'238c955f4b1e1157998af1f4c91f51adc6d0c71a5ca4a1494d11b7e881dabd336f0363310bde7256b5bfc8a520d4c2adbf30ffcab4fb8291875700fb4071e7fb'
	'5593ccf428c43ddc4202a4f1b83624beed285bd250e038e46a17379d5ce25f95c43df6515204df6bab69b28fc329386b93d90d1283f29b200ecbdec7fcf705ce'
)

package() {
	install -m 755 -D "steamwebhelper.sh" "$pkgdir/usr/lib/steam/steamwebhelper.sh"
	install -m 755 -D "steam-native-webhelper" "$pkgdir/usr/bin/steam-native-webhelper"
	install -m 755 -D "steamwebhelper.sh.override.f60cb3818ca4cb71" "$pkgdir/usr/lib/steam/steamwebhelper.sh.override.f60cb3818ca4cb71"
	install -m 755 -D "steamwebhelper.sh.override.8625e67eb3a5c5df" "$pkgdir/usr/lib/steam/steamwebhelper.sh.override.8625e67eb3a5c5df"
}
