# Maintainer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

_pkgname="MechanicalSoup"
pkgname=python2-mechanicalsoup
pkgver=0.4.0
pkgrel=2
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=('python2' 'python2-beautifulsoup4' 'python2-requests' 'python2-six')
makedepends=('python2-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('a07e9bda18944c9a5ff1bee4444b53324b99861fe3003c57e933c33bca29bfb6343fdea8a27c70c02d866e478e654016e2f246adb29c0a1536515c5dbf3f6d25')

check() {
  cd $srcdir/${_pkgname}-$pkgver 
  python2 setup.py check
}

package_python2-mechanicalsoup() {
  cd $srcdir/${_pkgname}-$pkgver 
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

