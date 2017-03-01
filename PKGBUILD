# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=python2-xmodem
_pkgname=xmodem
pkgver=0.4.4
pkgrel=1
pkgdesc="XMODEM protocol implementation"
arch=(any)
url="https://github.com/tehmaze/xmodem"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
_hash=bd/cc/c6748df0948bcc272f4bc66e468cbd15290df8df3e51f9d660af3eb4352f
source=(https://pypi.python.org/packages/$_hash/$_pkgname-$pkgver.tar.gz)
sha256sums=('bbbacfd8a72ede2479bd87cce748d092a3e5142ce90c8c7c2106ddf4c91f68a1')
sha512sums=('44465ad1c16873610c4122da8e4a10d1d6acdf5b787cd74edc204801d969dfb94c42d6e4fb323b79198cba437021650d3a78155e07646e1db9dab3a305619644')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
