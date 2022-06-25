# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: 潘一萱 <1138401083@qq.com>
pkgname=runner
pkgver=0.0.2
pkgrel=1
pkgdesc="A script to execut files"
arch=('x86_64')
url="https://github.com/Johnson170/runner"
license=('GPL')
makedepends=('git')
source=("$srcdir/$pkgname-$pkgver::git+https://github.com/Johnson170/runner.git")
md5sums=("SKIP")


build() {
	cd "$pkgname-$pkgver"
	chmod u+x runner.sh
}

package() {
	cd "$pkgname-$pkgver"
	sudo cp runner.sh /usr/bin/runner
	sudo chmod 755 /usr/bin/runner
}
