# Maintainer: Aaron Davidov <aaron.skib.aur@gmail.com>
pkgname=skib
pkgver=1.100
pkgrel=4
pkgdesc="A simple light aur helper."
arch=('x86_64')
url="https://github.com/SP4RKGT/skib"
license=('unknown')
depends=('bash' 'git')
makedepends=('shc')
source=('git+https://github.com/SP4RKGT/skib.git')
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	shc -f main.sh
}

package() {
	cd "$pkgname"
	sudo install -Dm755 main.sh.x /usr/bin/skib 
}
