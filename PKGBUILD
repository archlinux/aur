# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=git-big-picture
pkgver=1.1.1
pkgrel=1
pkgdesc="Visualization tool for Git repositories"
arch=('any')
url="https://github.com/git-big-picture/git-big-picture"
license=('GPL3')
depends=('python' 'git' 'graphviz')
makedepends=('git')
provides=('git-big-picture')
source=("https://github.com/git-big-picture/git-big-picture/archive/v$pkgver.tar.gz")
sha512sums=('f77681b43bb3323f5cdeb646c04af65d3553a2b375df97674a670200323ca94fe8dda12073d5d3ed5211ec17e88185cc5134f243b9fc948d7bee72249b11f543')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
