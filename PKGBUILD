# Maintainer: Chipster Julien <julien [dote] chipster [hate] archlinux [dote] fr>
pkgname=duty
url="https://github.com/Chipsterjulien/duty"
pkgver=0.2
pkgrel=4
pkgdesc="Make random duty in LaTeX"
arch=('any')
license=('GPL')
depends=(python)
source=($pkgname-$pkgver.tar.gz)
md5sums=('6e2020cf12d1f0efaa4274360a04322c')

package()
{
  cd "$srcdir/$pkgname-$pkgver/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
