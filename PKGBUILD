# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=pridefetch
pkgver=1.1.0
pkgrel=1
pkgdesc="Neofetch clone written in Python with the ability to display pride flags"
arch=('any')
url="https://github.com/SpyHoodle/pridefetch"
source=("git+https://github.com/SpyHoodle/pridefetch")
depends=('python3' 'python-distro')
makedepends=('git')
sha512sums=('SKIP')

package() {
	cd $pkgname
	install -Dm755 pridefetch "$pkgdir"/usr/bin/pridefetch
}
