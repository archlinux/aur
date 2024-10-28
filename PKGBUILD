# Maintainer: hanker <91734413+hankertrix@users.noreply.github.com>
# Contributor: Perseo <perseo.gi98@gmail.com>
pkgname=xsct
pkgver=2.3
pkgrel=1
_gitname=sct

pkgdesc="Improved sct (set screen color temperature)"
arch=('i686' 'x86_64')
url="https://github.com/faf0/${_gitname}"
license=('Unlicense')
depends=('glibc' 'libx11' 'libxrandr')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/faf0/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=('2b542a0a1290d06c28661f8d3bab1266ef897b621c9c7185a7c51465e68b0414')

package() {
    cd "$srcdir/${_gitname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
