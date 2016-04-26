# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="repo-maintainer"
pkgver=0.2.0
pkgrel=1
pkgdesc="Tools for maintaining repositories for ArchLinux"
arch=('any')
url="https://git.0ptr.de/nullptr_t/repo-maintainer"
license=('GPL3')
depends=('yaourt' 'libnotify')
makedepends=()
source=("git+https://git.0ptr.de/nullptr_t/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')


package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="${pkgdir}" install
}

