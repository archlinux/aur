# Maintainer: hamki <hamki.do2000@gmail.com>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: happy4pizza

pkgname=(
	nordic-theme
	nordic-standard-buttons-theme
	# nordic-polar-theme
	nordic-polar-standard-buttons-theme
	nordic-darker-theme
	nordic-darker-standard-buttons-theme
	nordic-bluish-accent-theme
	nordic-bluish-accent-standard-buttons-theme)
pkgver=2.1.0
pkgrel=2
pkgdesc="Nord-derived themes for GTK and other platforms"
arch=('any')
url="https://github.com/EliverLara/Nordic"
license=('GPL3')
source=(
	"nordic-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic.tar.xz"
	# "nordic-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-v40.tar.xz"
	"nordic-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-standard-buttons.tar.xz"
	# "nordic-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-standard-buttons-v40.tar.xz"
	# "nordic-polar-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-Polar.tar.xz"
	# "nordic-polar-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-Polar-v40.tar.xz"
	"nordic-polar-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-Polar-standard-buttons.tar.xz"
	# "nordic-polar-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-Polar-standard-buttons-v40.tar.xz"
	"nordic-darker-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-darker.tar.xz"
	# "nordic-darker-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-darker-v40.tar.xz"
	"nordic-darker-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-darker-standard-buttons.tar.xz"
	# "nordic-darker-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-darker-standard-buttons-v40.tar.xz"
	"nordic-bluish-accent-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-bluish-accent.tar.xz"
	# "nordic-bluish-accent-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-bluish-accent-v40.tar.xz"
	"nordic-bluish-accent-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/nordic-bluish-accent-standard-buttons.tar.xz"
	# "nordic-bluish-accent-standard-buttons-theme-$pkgver.tar.xz::$url/releases/download/v$pkgver/nordic-bluish-accent-standard-buttons-v40.tar.xz")
)
sha256sums=('cce429254c31473571963b5125e8fb652ce517bbec5245b1e17fe975b9bfd10b'
            '6f641957eca90598ac8cb7992ea4392cb6ba599d4078d22cc41b04cfd134caea'
            '618643127d063f03ac3d890f74779f4bf070fa4c17ab0f42f97e49c3dc8744fa'
            '2916b6657840022f4bfd3b49b549115da6c79f6a176b38cb3c581bddea44854d'
            '50a508bc8c505ee774bc5e1292f03f237e5d57c9fd3e4be2f0edd7f7bf6c6016'
            '2e11de30494a42458b11a95fe8251982db46e6d6e84362034bdd0b778461a84e'
            '2c87d6c377a74720297c96248ac6a935e9fc11f2199c9cf7785628138ffe0e1b')

PURGE_TARGETS=('LICENSE' 'README.md')

_package() {
	local _name="$1"

	cd "$_name"
	install -d "$pkgdir/usr/share/themes/$_name/"
	cp -a --no-preserve=ownership . "$pkgdir/usr/share/themes/$_name/"
}

package_nordic-theme() {
	_package "Nordic"
}

package_nordic-standard-buttons-theme() {
	_package "Nordic-standard-buttons"
}

# package_nordic-polar-theme() {
# 	_package "Nordic-Polar"
# }

package_nordic-polar-standard-buttons-theme() {
	_package "Nordic-Polar-standard-buttons"
}

package_nordic-darker-theme() {
	_package "Nordic-darker"
}

package_nordic-darker-standard-buttons-theme() {
	_package "Nordic-darker-standard-buttons"
}

package_nordic-bluish-accent-theme() {
	_package "Nordic-bluish-accent"
}

package_nordic-bluish-accent-standard-buttons-theme() {
	_package "Nordic-bluish-accent-standard-buttons"
}
