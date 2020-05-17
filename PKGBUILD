# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-soundcard
pkgver=0.3.3
pkgrel=1
pkgdesc='Play and record audio without resorting to CPython extensions'
arch=(any)
url='https://github.com/bastibe/SoundCard'
license=('BSD3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/c3/31/b6098569bbb551b67a8631ba1197a037ad66c7795198f8dcc194a60fc053/SoundCard-${pkgver}.tar.gz")
sha512sums=('fa8c76356098bfb6c0002ab3a9305cc43f4022b23578f45157294fda25cc99fa1c08c2479ff7762b1952615807f13959943f51ef9e1c944587391c26039d3d82')

package() {
  cd "SoundCard-${pkgver}"
  python setup.py install --root="$pkgdir"
}
