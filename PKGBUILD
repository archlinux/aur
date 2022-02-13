# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Aaron <wzj020109@163.com>
_pkgname=st
pkgname=ahdumb-$_pkgname
pkgver=0.8.5
pkgrel=4
pkgdesc="st is a simple terminal implementation for X."
arch=("x86_64")
url="https://github.com/AhDumb/st.git"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/AhDumb/st.git")
md5sums=('SKIP')

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
    sudo make install
}
