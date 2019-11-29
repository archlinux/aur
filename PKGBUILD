# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>

pkgname=breezy
pkgver=3.0.2
pkgrel=1
pkgdesc="A version control system forked from the dead Bazaar (bzr)"
arch=('x86_64')
url=https://www.breezy-vcs.org/
license=('GPL2')
depends=('python-configobj')
makedepends=('python-setuptools')
optdepends=('python-oauthlib: support for launchpad API'
            'python-launchpadlib: support for launchpad API')
source=("https://launchpad.net/brz/3.0/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('50f16bc7faf299f98fe58573da55b0664078f94b1a0e7f0ce9e1e6a0d47e68e0')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --install-data="usr/share" --optimize=1
}

# vim:set ts=2 sw=2 et:
