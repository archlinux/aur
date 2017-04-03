# Maintainer: Jelle van der Waa <jelle@archlinux.org>
pkgname=mpy-utils
pkgver=0.1.5
pkgrel=1
pkgdesc="Utility programs for Micropython"
arch=('any')
url="https://github.com/nickzoic/mpy-utils"
license=('MIT')
depends=('python' 'python-pyserial' 'python-fusepy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nickzoic/mpy-utils/archive/v0.1.5.tar.gz")
sha256sums=('44059a9db90659bc6d96f3f9f4621951fe6452529f037dc08b480c278d97faa5')

package() {
	cd "$pkgname-$pkgver"
        python3 setup.py install --root="$pkgdir/"
}
