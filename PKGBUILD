# Maintainer: KopfKrieg <archlinux [at] absolem [dot] cc> 
# Maintainer: robertfoster
pkgname=python-gnupg-isis
name=python-gnupg
pkgver=3.0.0
pkgrel=1
pkgdesc='A modified version of python-gnupg, including security patches, extensive documentation, and extra features. The gnupg module allows Python programs to make use of the functionality provided by the GNU Privacy Guard.'
url='https://github.com/isislovecruft/python-gnupg'
license=('GPL3')
arch=('any')
depends=('python' 'gnupg' 'python-psutil')
conflicts=('python-gnupg')
provides=('python-gnupg')
source=("https://github.com/isislovecruft/python-gnupg/archive/$pkgver.tar.gz")

build() {
  cd $name-$pkgver
  python setup.py build
}

package() {
  cd $name-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
md5sums=('aa8b038e3b8b10785d09d5bb04aff513')
