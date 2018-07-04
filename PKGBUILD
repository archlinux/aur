# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
pkgname=wakatime
pkgver=10.2.1
pkgrel=1
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('any')
url="https://github.com/wakatime/wakatime"
license=('BSD-3-Clause')
groups=()
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
# source=("https://pypi.python.org/packages/7c/28/7d98467580850eb41d75a6b988fabf68caa0e930882f6f3188fe68a01c8b/$pkgname-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('cffbd48ceee97841a395b2c325c00ddf')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
