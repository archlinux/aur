# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=symp

# Version
pkgver=5.2.1
pkgrel=1

# Generic
pkgdesc='Populate directories with least amount of symlinks'
arch=(any)
url='https://github.com/Dracape/SymP'
license=('MIT')

# Dependencies
depends=('fish' 'fd')
makedepends=('fish' 'fd')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dracape/${pkgname}/archive/refs/tags/${pkgver}.zip")

b2sums=('347403ca5eadbe8440a6ea8ce3162fddbfae632174c1fbbee6b32758b498ddeb7c2bbf5a1c7db669aa5fdba2fdd0edcaf63346675f0f6eee48a32c903e54dbf7')


package() {
	"SymP-$pkgver"/install.fish --vendor --repository="SymP-$pkgver" --rootdir=${pkgdir}
}
