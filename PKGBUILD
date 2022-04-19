# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Bash <3141495167@qq.com>
pkgname=ccao
pkgver=0.7
pkgrel=1
epoch=
pkgdesc="A tool for C/C++ to build project and manage lib from starserver."
arch=(x86_64)
url="http://www.freet.tech/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitee.com/cfreet/ccao/attach_files/1032652/download/ccao")
noextract=()
md5sums=('95694e0f121deef1f3abe6e6c46359cc')
validpgpkeys=()
package() {
	sudo chmod 777 ${srcdir}/ccao
	sudo cp ${srcdir}/ccao /usr/bin/ccao
}
