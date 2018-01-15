# Maintainer: mickael9 <mickael9@gmail.com>

pkgname=python-yaswfp
_name=yaswfp
pkgver=0.9.3
pkgrel=1
pkgdesc='Yet Another SWF Parser'
depends=(python)
license=('GPL3')
arch=('any')
url='https://github.com/facundobatista/yaswfp'
source=("https://pypi.org/packages/source/${_name:0:1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('6171057367476bbb511ae1ff95f0963f86079dd2fcb0e9771c6d9763ed351c8d')

package() {
  cd ${_name}-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm 644 README.rst -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
