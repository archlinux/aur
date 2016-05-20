# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="repo-maintainer"
pkgver=0.4.0
pkgrel=1
pkgdesc="Tools for maintaining repositories for ArchLinux [BETA]"
arch=('any')
url="https://git.0ptr.de/nullptr_t/repo-maintainer"
license=('GPL3')
depends=('pacman>=5' 'git' 'libnotify' 'gnupg')
makedepends=()
conflicts=('repo-scripts' 'repo-maintainer-git')
source=("git+https://git.0ptr.de/nullptr_t/$pkgname.git#tag=v$pkgver")
md5sums=('SKIP')
backup=('etc/repo-maintainer.conf')


package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="${pkgdir}" install
}

