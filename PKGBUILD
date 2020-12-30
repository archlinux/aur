# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=git-big-picture
pkgver=0.10.1
pkgrel=1
pkgdesc="Visualization tool for Git repositories"
arch=('any')
url="https://github.com/git-big-picture/git-big-picture"
license=('GPL3')
depends=('python' 'git' 'graphviz')
makedepends=('git')
provides=('git-big-picture')
source=("https://github.com/git-big-picture/git-big-picture/archive/v$pkgver.tar.gz")
md5sums=('7198106c60213fe99889f573be74557f')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
