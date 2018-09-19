# Maintainer: varris <varris@protonmail.com>
pkgname=krakenx
pkgver=0.0.3
pkgrel=1
pkgdesc='Python script to control NZXT Kraken X52/X62/X72 coolers'
arch=('any')
url='https://github.com/KsenijaS/krakenx.git'
license=('GPL')
depends=('python' 'python-pyusb')
makedepends=('python-setuptools')
source=("https://github.com/KsenijaS/krakenx/archive/v${pkgver}.tar.gz")
md5sums=('1a40dae234e209aabb27cbf536232c91')

build() {  
    cd "krakenx-${pkgver}"
    python setup.py build
}

package() {
    cd "krakenx-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
