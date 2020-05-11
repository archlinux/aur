# Maintainer: 5anya <sanya at national dot shitposting dot agency>
pkgname=updsched
pkgver=1.1
pkgrel=1
pkgdesc="An automatic Arch Linux update download scheduler"
arch=('any')
url="https://github.com/head47/updsched"
license=('AGPL3')
depends=('pacman' 'sudo' 'libnotify' 'dunst' 'iputils')
optdepends=('xterm: upgrade installation support')
source=("https://github.com/head47/updsched/archive/$pkgver.zip")

package() {
	cd "$pkgname-$pkgver"
	cp -r usr/ "$pkgdir/"
}
md5sums=('37d5b85f4e17ddda721b6e462e3a38a2')
