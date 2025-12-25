# Maintainer: Dracape <Dracape at outlook dot com>

pkgname=symp

# Version
pkgver=5.2.2
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dracape/${pkgname}/archive/refs/tags/${pkgver}.zip")

b2sums=('2292b69cda5f3b59925cffc9e1b19c4adced5b6234c1cc5c8829ff81986290510f4fea27f02af35b1074d9e5699a31b8646d58ff835e844221e7662045f270c6')


package() {
	"SymP-$pkgver"/install.fish --vendor --repository="SymP-$pkgver" --rootdir=${pkgdir}
}
