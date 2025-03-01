# Maintainer: skwerlman <skw@tetrarch.co>

pkgname=pass-index-git
_name=${pkgname%-git}
pkgver=r6.2c162df
pkgrel=1
pkgdesc='An "index" to speed up content search for pass - the standard unix password store'
arch=('any')
url='https://github.com/sboesebeck/pass-index'
license=(Apache-2.0)
depends=('pass' 'bash')
optdepends=()
makedepends=()
source=("${_name}"::"git+https://github.com/sboesebeck/pass-index.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${_name}"
    PROG=index DESTDIR=${pkgdir} make install
}
