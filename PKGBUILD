# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=symp

# Version
pkgver=5.2.5
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
b2sums=('80ba934a00cd5618ff8e017d7dad65a52cdd2b020ab8ac46e1940af2ddf08c7c02442e3c7ca21a7fb7f49117d27c607434505bb06ff006c36b422e150ff45f7a')


package() { "SymP-$pkgver"/install.fish --vendor --repository="SymP-$pkgver" --rootdir=${pkgdir}; }
