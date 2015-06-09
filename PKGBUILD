# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-commandr
pkgver=1.3.2
pkgrel=1
pkgdesc="Simple tool for making Python functions accessible from the command line"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/tellapart/commandr"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('418bc979bd68fcd39f0287a4d2b95ee9')
sha256sums=('2bf0117512a9b2c0866bd26a66234658c960459775bbb7d8e3ff3190dd862f06')

package() {
  cd $srcdir/${pkgname#python2-}-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
