# Maintainer: 5anya <sanya at national dot shitposting dot agency>
pkgname=updsched
pkgver=1.0.1
pkgrel=1
pkgdesc="An automatic Arch Linux update download scheduler"
arch=('any')
url="https://github.com/head47/updsched"
license=('AGPL3')
depends=('pacman' 'sudo' 'libnotify' 'dunst' 'iputils')
source=("https://github.com/head47/updsched/archive/$pkgver.zip")

package() {
	cd "$pkgname-$pkgver"
	cp -r usr/ "$pkgdir/"
}
md5sums=('5a71f676e3c6eaa9aa3312ee78f115ad')
