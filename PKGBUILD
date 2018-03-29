# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Marc Schmitt <marc.schmitt@marcerisson.space>
# Contributor: Original maintainer: Mevouc <meven.courouble@vouc.me>
pkgname=epifortune
pkgver=v1.0
pkgrel=1
pkgdesc="A fortune-like program which provide quotes from Epiquote."
arch=(any)
url="https://github.com/Marcerisson/epifortune"
license=('MIT')
source=(git://github.com/Marcerisson/$pkgname/)
md5sums=('SKIP')

build() {
    cd $pkgname/
    make || return 1
}

package() {
	cd $pkgname/
	sudo install -D -m755 ./$pkgname /usr/bin/$pkgname
}

check() {
	cd $pkgname
}
