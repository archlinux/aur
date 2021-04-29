# Maintainer: Your Name <youremail@domain.com>
pkgname=nofetch-git
_pkgname=nofetch
pkgver=1.0
pkgrel=1
pkgdesc="the simple man's fetch tool"
arch=('any')
url="https://github.com/jnats/nofetch"
license=('GPL')
depends=()
provides=('nofetch')

source=("nofetch::git+https://github.com/jnats/nofetch.git")

md4sums=("SKIP")

package() {
	cd $_pkgname
	chmod +x nofetch
	mkdir -p $pkgdir/usr/bin
	cp nofetch $pkgdir/usr/bin 
}
md5sums=('SKIP')
