# Contributor: wszqkzqk <wszqkzqk@gmail.com>

pkgname=bcloud
pkgver=3.9.4
pkgrel=1
pkgdesc='Baidu Pan client for Linux Desktop users'
url='https://github.com/poplite/bcloud'
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python' 'python-keyring' 'python-urllib3' 'python-gobject'  'python-dbus'  'python-cssselect' 'python-lxml' 'python-crypto' 'python-pyinotify' 'libappindicator-gtk3' 'libnotify')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fce56763bda46ecc372685f4cb881766596cd1f8bcca21b0ed2a5fe9c3531ddb')
conflicts=("bcloud-git")

package() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

