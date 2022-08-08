# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver='1.9.8'
pkgrel=2
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
url="https://github.com/Evidlo/passhole"
makedepends=('python-setuptools' 'git')
depends=("python-pynput" "python-pykeepass" "python-pykeepass_cache" "python-colorama" "python-future" "python-pyotp" )
source=("https://github.com/Evidlo/passhole/archive/v$pkgver.tar.gz")
sha512sums=('941a3b12587f3c97baf420a679639394f801b1880ccb8f95a084a58478826bc1f462d5d902a9fca893d9e750c90bc387eddcabd1b7ba73da5c84ec3097e28de4')

package() {
  cd "$srcdir/passhole-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
