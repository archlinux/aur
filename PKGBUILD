# Maintainer: portaloffreedom

_pkgsrcname=pyjokes
pkgname=python-pyjokes
pkgver=0.6.0
pkgrel=1
pkgdesc="One line jokes for programmers (jokes as a service)"
url="https://github.com/pyjokes/pyjokes"
license=("custom:BSD")
arch=("any")
depends=('python')
source=("https://files.pythonhosted.org/packages/c2/82/faa0a9676ba148de181793a81f193f4a5a9eb344b4faf80fa28d8b1c8f3f/$_pkgsrcname-$pkgver.tar.gz")
sha256sums=('08860eedb78cbfa4618243c8db088f21c39823ece1fdaf0133e52d9c56e981a5')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


