# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.3.1
pkgrel=1
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python' 'fuse')
makedepends=('python-setuptools')
source=(http://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('e826c39969f6ba424210d7506b3d63b3cbebfba52caba7beeaaa468cd62ffcd5')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}"
}
