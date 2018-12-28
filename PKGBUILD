# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-soundcard
pkgver=0.2.2
pkgrel=1
pkgdesc='Play and record audio without resorting to CPython extensions'
arch=(any)
url='https://github.com/bastibe/SoundCard'
license=('BSD3')
depends=('python')
source=("https://files.pythonhosted.org/packages/bc/82/08f54615df6307ccfce43f0fc7dca63d0ef6df9afddbe2843a82ee25a861/SoundCard-${pkgver}.tar.gz")
sha512sums=('0a92290f3d315de178f44e84e1bffeaa3ab831132768ff589793aa2c517a1586251bb276669be17ee33d5d836f1bc6beb54280276a6a0322bfe1d60436fce291')

package() {
  cd "SoundCard-${pkgver}"
  python setup.py install --root="$pkgdir"
}
