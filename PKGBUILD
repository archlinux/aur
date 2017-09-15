# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=0.2
pkgrel=1
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
sha256sums=('8d64ea4aebf0ab4e0387e267c4d8d8230bca20902408a24010e98b93f089126d')

package() {
  cd "${srcdir}/pass-import-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
