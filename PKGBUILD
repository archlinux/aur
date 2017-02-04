# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=0.1
pkgrel=3
pkgdesc='A generic importer extension for the standard unix password manager pass'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass')
optdepends=('python2: for importer script support'
            'python3: for importer script support'
            'ruby: for importer script support'
            'perl: for importer script support')
source=(https://github.com/roddhjav/pass-import/archive/${pkgver}.tar.gz)
sha256sums=('6739189ac5f00e4d074ba14d0008a435289d9acb360c938069b2e188f0f73091')

package() {
  cd "${srcdir}/pass-import-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
