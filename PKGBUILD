# Maintainer: la Fleur <lafleur at boum dot org>
# Contributor: Ivan Cai <caizixian@users.noreply.github.com>

pkgname=python-iptables
pkgver=1.0.1
pkgrel=1
pkgdesc='Python bindings for iptables'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/ldx/python-iptables'
license=('Apache')
groups=()
depends=('python' 'iptables')
makedepends=('python-setuptools' 'gcc')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/ldx/${pkgname}/archive/v${pkgver}.tar.gz")

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('0ab4d2b1e4c268717dd2e7cb0f527dee06f39cdcdd763f1803a6f2618fe410ee')
