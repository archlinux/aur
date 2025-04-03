# Maintainer: carlyle

pkgname=aurx
pkgver=20250403
pkgrel=1
pkgdesc="An AUR helper written in C."
arch=('x86_64')
url="https://github.com/carlyle-felix/aurx"
license=( 'GPL-3.0-or-later' )
depends=(
        'base-devel'
        'git'
        'json-c'
        'libcurl-gnutls'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
build() {
	cd "${srcdir}/${pkgname}"
        make
}

package() {
        cd "${srcdir}/${pkgname}"
        sudo make install
}
