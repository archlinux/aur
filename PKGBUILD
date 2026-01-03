# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=symp

# Version
pkgver=5.2.6
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
b2sums=('f78600fdd23e5364eb4d4cec9fdfa9e754893f8b83ba4f0cddab18ad43023467411ca54114269dde43e28e71f99c8c50e113d36f14d43e60e42b406e7b223d9c')


package() { "SymP-$pkgver"/install.fish --vendor --repository="SymP-$pkgver" --rootdir=${pkgdir}; }
