pkgname=('mcu-info-util-git')
pkgver=0.1
pkgrel=1
pkgdesc='Small utility for generate C/C++ headers and linker script for some MCUs'
arch=('any')
url='https://github.com/KivApple/mcu-info-util'
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=('mcu-info-util::git+https://github.com/KivApple/mcu-info-util')
md5sums=('SKIP')

package() {
    cd mcu-info-util
    python setup.py bdist
    cd $pkgdir
    tar -xzvf $srcdir/mcu-info-util/dist/mcu-info-util-*.tar.gz
}
