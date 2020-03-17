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
md5sums=('1f5aeca9de0c6e25b5894c60ca8e733b'
         '2c9bb36e3d797a6a3462bf69b6033cfe'
         '4559d231974618def3ab832ad21f9e0d')
