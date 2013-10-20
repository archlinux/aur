# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl

# Maintainer: Yaron de Leeuw <jdlmail at gmail >
# Contributor: Bruno Carlin <self at aerdhyl dot eu>

pkgname=python-setuptools_git
pkgver=1.0
pkgrel=1
pkgdesc="Setuptools revision control system plugin for Git"
arch=(any)
url="http://pypi.python.org/pypi/setuptools-git"
license=('BSD')
depends=('python' 'python-setuptools' 'git')
source=("http://pypi.python.org/packages/source/s/setuptools-git/setuptools-git-$pkgver.tar.gz")
md5sums=('de63b541a10c2b83caa478c687458b16')

package() {
  cd $srcdir/setuptools-git-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

