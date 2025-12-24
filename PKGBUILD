# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=symp

# Version
pkgver=5.2.0
pkgrel=1

# Generic
pkgdesc='Populate directories with least amount of symlinks'
arch=(any)
url='https://github.com/Dracape/SymP'
license=('MIT')

# Dependencies
depends=('fish' 'fd')
makedepends=('fish' 'fd')

source=("${pkgvar}-${pkgver}.tar.gz::https://github.com/Dracape/${pkgname}/archive/refs/tags/${pkgver}.zip")

b2sums=('b39921de8eca23fe8e61a04e14a4373953598edbe25b04b0014a9837e07b4512cb585cc79f8dfa152c2cb9d8619bdf4b1dca8910bd9a5455c6afd3cd982c7ca0')


package() {
	"SymP-$pkgver"/install.fish --vendor --repository="SymP-$pkgver" --rootdir=${pkgdir}
}
