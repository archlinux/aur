# Maintainer: Yash Karandikar <nerdstep710@gmail.com>

pkgname=haur
pkgver=2.1
pkgrel=1
pkgdesc="Helper for the Arch User Repository"
arch=('any')
url="https://github.com/karx1/haur"
license=('LGPLv3')
depends=('bash' 'git')
source=("haur" "Makefile")
prepare () {
	make clean
}
package () {
	make install srcdir=$srcdir pkgdir=$pkgdir
}
md5sums=('7f7fba89eb830a32415f4e57b2425e66'
         '8348486f4c23d9987ed97f161cf50e79')
