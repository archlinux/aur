# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=symp

# Version
pkgver=5.2.10
pkgrel=1

# Generic
pkgdesc='Populate directories with least amount of symlinks'
arch=(any)
url='https://github.com/Dracape/SymP'
license=('MIT')

# Dependencies
depends=('fish' 'fd')
makedepends=('fish' 'fd')
conflicts=('symp-git')

# Download
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dracape/${pkgname}/archive/refs/tags/${pkgver}.zip")
b2sums=('cb30d2edf9edf96bf677b3c0905970e86cbaffacb3b549d838a686c1870f045064833b1a009b8d04e8086cf8ea50893a090c74b2caf3fe87086881137f2febb2')


package() { "SymP-$pkgver"/install.fish --vendor --repository="SymP-$pkgver" --rootdir=${pkgdir}; }
