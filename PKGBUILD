# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gitfs
pkgver=0.4.3
pkgrel=1
pkgdesc="Version controlled file system"
arch=('any')
url="http://www.presslabs.com/gitfs/"
license=('Apache')
depends=('python-atomiclong' 'python-fusepy' 'python-pygit2>=0.24.0')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/PressLabs/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('d8dcfb176c0672cb72f0fc3718ccfd76420979be92668f440a81579b2438adc0')

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1
}
