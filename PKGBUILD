# Maintainer: Jakov Petrina Trnski <jkv.petrina@gmail.com>
# Contributor: Daniel Maslowski <info@orangecms.org>
pkgname=git-big-picture
pkgver=1.3.0
pkgrel=1
pkgdesc="Visualization tool for Git repositories"
arch=('any')
url="https://github.com/git-big-picture/git-big-picture"
license=('GPL3')
depends=('python' 'git' 'graphviz')
makedepends=('git')
provides=('git-big-picture')
source=("https://github.com/git-big-picture/git-big-picture/archive/v$pkgver.tar.gz")
sha512sums=('59e26660a99868999e6b82e970a5e999bfd334a0123bc8071bead80fab5a93f3a88db9f7114db173aa98e2c22c3469f325eb3990cbcfb2afe67a1a43e709b447')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
