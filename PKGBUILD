# Maintainer: Yash Karandikar <nerdstep710@gmail.com>

pkgname=haur
pkgver=2.2
pkgrel=2
pkgdesc="Helper for the Arch User Repository"
arch=('any')
url="https://github.com/karx1/haur"
license=('LGPLv3')
depends=('bash' 'git')
source=("haur" "haurrc" "Makefile")
prepare () {
	make clean
}
package () {
	make install srcdir=$srcdir pkgdir=$pkgdir
}
md5sums=('20c61a17d6fc0a04a63aa861954c773d'
         '8348486f4c23d9987ed97f161cf50e79')
