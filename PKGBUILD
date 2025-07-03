# Maintainer: Ivan Chetchasov <vi.is.chapmann@gmail.com>
pkgname=vinyl-papers
pkgver=1.1.1
pkgrel=1
pkgdesc="Paper selection utility for Vinyl"
arch=('any')
url="https://tvoygit.ru/vi_is_lonely/vinyl"
license=('MIT')
depends=('gtk3' 'imagemagick')
makedepends=('dub' 'ldc')
source=()
sha256sums=()

build() {
    echo "RUNNED BUILD BY $USER"
    git clone https://tvoygit.ru/vi_is_lonely/vinyl-papers.git
    cd vinyl-papers
    dub build --build=release
    cd ..
    echo "BUILD COMPLETED"
}

package() {
    echo "RUNNED PACKAGE BY $USER"
    cd vinyl-papers
    sudo sh install.sh
    cd ..
    sudo rm -rf vinyl-papers
    echo "PACKAGE COMPLETED"
}

