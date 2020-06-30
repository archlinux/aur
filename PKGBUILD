# Maintainer: Nico <desoxhd@gmail.com>
pkgname=cadmus-deb
pkgver=0.0.1
pkgrel=1
pkgdesc="A GUI frontend for @werman's Pulse Audio real-time noise suppression plugin"
arch=('x86_64')
url="https://github.com/josh-richardson/cadmus/"
license=('GPL3')
makedepends=('tar')
conflicts=('cadmus' 'cadmus-appimage')
provides=('cadmus')
depends=('hicolor-icon-theme' 'zlib')
source=(https://github.com/josh-richardson/cadmus/releases/download/${pkgver}/cadmus.deb)
sha256sums=('3ec2b2bd28a7a3496e4db45ce83dc9c3ae71e13b6db06be03046edaaf9645518')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"
} 
