# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver=3.2.1
pkgrel=1
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
url="https://github.com/Evidlo/passhole"
makedepends=('python-setuptools' 'git')
depends=("python-future" "python-future" "python-pykeepass" "python-pygpgme" "python-colorama" "python-pyuserinput-git" "python-easypysmb" "python-pykeepass_cache" "python-rpyc" "python-daemon")
source=("https://github.com/Evidlo/passhole/archive/v$pkgver.tar.gz")
sha512sums=('16f008b8adf45625333200f12093beeb0f5c07c7d55d613c5ff26c9ab98e3e1bca13f97cc7c8c7f074b5c19a8ee3946dda9faf8b660f057b198b9eee1c263dd2')

package() {
  cd "$srcdir/passhole-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
