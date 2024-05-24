# Maintainer: bendn <bend.n@outlook.com>
pkgname="kmpsat"
pkgver='1'
pkgrel=1
pkgdesc="satpaper with flags"
arch=('any')
url='https://github.com/koompi-os/satpaper'
license=('MIT')
source=('https://github.com/koompios/satpaper/releases/download/1.0.0/satpaper-goldmont-musl.x86_64')
sha256sums=('3586243d4d4ee729da6448ed589b4cbe4f39dd590b98a44738431079bcfe19b4')

package() {
	install -Dm755 "satpaper-goldmont-musl.x86_64" "$pkgdir/usr/bin/satpaper"
}
