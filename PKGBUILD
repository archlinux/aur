# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: 潘一萱 <2160634639@qq.com>
pkgname=runner-bin
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="An interesting and useful shell instruction."
arch=('x86_64')
url="https://gitlab.com/hoggadams/runner"
license=('GPL')
groups=()
depends=('bash' 'python3' 'firefox' 'gcc')
makedepends=('git')
source=("$pkgname-$pkgver::${url}")
noextract=("")
md5sums=('SKIP')

build() {
	git clone https://gitlab.com/hoggadams/runner
	cd runner
	chmod +x install.sh
}

package() {
	cd runner	
	source ./install.sh
}
