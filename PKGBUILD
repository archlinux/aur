# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>

pkgname=breezy
pkgver=3.0.1
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
sha256sums=('a118276a1eb8948f30c3f043f7e7a1c20d4e8bb1e0044005d524e0a53f3ca3cb')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --install-data="usr/share" --optimize=1
}

# vim:set ts=2 sw=2 et:
