# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=python2-ayah
pkgver=1.0.4
pkgrel=1
pkgdesc="Are You a Human (AYAH) Python integration library and CAPTCHA alternative"
arch=('any')
url="http://www.areyouahuman.com/"
license=('MIT')
depends=('python2')
makedepends=()
options=(!emptydirs)
source=("http://portal.areyouahuman.com/downloads/are-you-a-human-$pkgver.tar.tar.gz")
sha256sums=('67b8e4dd1710bba75e5331a98a91d93d9c731278eb0cabb9a72f95e1b22a8570')

package() {
  cd "$srcdir/are-you-a-human-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
