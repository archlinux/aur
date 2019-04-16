# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>

pkgname=breezy
pkgver=3.0.0
pkgrel=2
pkgdesc="A version control system forked from the dead Bazaar (bzr)"
arch=('x86_64')
url=https://www.breezy-vcs.org/
license=('GPL2')
depends=('python-configobj')
makedepends=('python-setuptools')
optdepends=('python-oauthlib: support for launchpad API'
            'python-launchpadlib: support for launchpad API')
source=("https://launchpad.net/brz/3.0/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('d5723a7a3fcaa827bf2731c20df5240d7063c7728b2db3a5d58bc90f6257f878')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --install-data="usr/share" --optimize=1
}

# vim:set ts=2 sw=2 et:
