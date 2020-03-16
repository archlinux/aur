# Maintainer: Yash Karandikar <nerdstep710@gmail.com>

pkgname=haur
pkgver=3.2
pkgrel=1
pkgdesc="Helper for the Arch User Repository"
arch=('any')
url="https://github.com/karx1/haur"
license=('LGPLv3')
provides=("haur")
depends=('bash' 'git' 'jq')
source=("haur" "haurrc" "Makefile")
prepare () {
	make clean
}
package () {
	make install srcdir=$srcdir pkgdir=$pkgdir
}
md5sums=('22c5c88ce11a0a12716ce8ae98bf2553'
         '2c9bb36e3d797a6a3462bf69b6033cfe'
         'c1051c8c4fe078e1f90b1ff0278f6a8d')
