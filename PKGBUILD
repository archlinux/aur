# Maintainer: Yash Karandikar <nerdstep710@gmail.com>

pkgname=haur
pkgver=3.0
pkgrel=1
pkgdesc="Helper for the Arch User Repository"
arch=('any')
url="https://github.com/karx1/haur"
license=('LGPLv3')
provides=("haur")
depends=('bash' 'git')
source=("haur" "haurrc" "Makefile")
prepare () {
	make clean
}
package () {
	make install srcdir=$srcdir pkgdir=$pkgdir
}
md5sums=('dcc8ccfc2075b2b466ef1c6ae4a142db'
         'c075ed440b2e5c769603cd812f404c4e'
         'c1051c8c4fe078e1f90b1ff0278f6a8d')
