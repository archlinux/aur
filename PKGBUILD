# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python-ipify
pkgver=1.0.0
pkgrel=1
pkgdesc="The official client library for ipify: A Simple IP Address API"
arch=('any')
url="https://github.com/rdegges/python-ipify"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/rdegges/$pkgname/archive/$pkgver.tar.gz)
md5sums=('7b9631a2b984e569613d0fdacbaa7930')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1

#license
  install -Dm644 UNLICENSE "${pkgdir}"/usr/share/licenses/$pkgname/UNLICENSE
}
