# Maintainer: Drazape <Drazape at outlook dot com>

pkgname=symp

# Version
pkgver=5.2.13
pkgrel=1

# Generic
pkgdesc='Populate directories with least amount of symlinks'
arch=(any)
url='https://github.com/Drazape/SymP'
license=('MIT')

# Dependencies
depends=('fish' 'fd')
makedepends=('fish' 'fd')
conflicts=('symp-git')

# Download
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drazape/${pkgname}/archive/refs/tags/${pkgver}.zip")
b2sums=('25b3f906e5baadc97399e58f924587e4c7b69ef099e7ec633cdd37dd5c4122c4019a6052e65119086e960d7ccaefd3d1c50c792dc1f67f3edf83d4b67a609df2')


package() { "SymP-$pkgver"/install.fish --vendor --repository="SymP-$pkgver" --rootdir=${pkgdir}; }
