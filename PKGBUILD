# Maintainer: Mateen Ulhaq <mulhaq2005+aur@gmail.com>

pkgname=python-mouse
pkgver=0.7.1
pkgrel=1
pkgdesc="Hook and simulate mouse events on Windows and Linux"
arch=("any")
license=("MIT")
url="https://github.com/boppreh/mouse"
depends=("python-setuptools")
source=("https://github.com/boppreh/mouse/archive/v$pkgver.tar.gz")
sha512sums=("7ebc9c9f9d2e7638eac06358cd619d345c4846c09b33e5c85855df410e9e13181383d436293be32f874c442aa670ba986559e3ebbad9c111e2b607ad18da1342")

build() {
  cd mouse-$pkgver
  python setup.py build
}

package() {
  cd mouse-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

