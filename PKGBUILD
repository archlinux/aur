# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver='1.10.1' # renovate: datasource=github-tags depName=Evidlo/passhole
pkgrel=1
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
url="https://github.com/Evidlo/passhole"
makedepends=('python-setuptools' 'git')
depends=("python-pynput" "python-pykeepass" "python-pykeepass_cache" "python-colorama" "python-pyotp" )
source=("https://github.com/Evidlo/passhole/archive/v$pkgver.tar.gz")
sha512sums=('82c87d80c78101a868180378b94c305a87f718dae2d160b8305901deb33218771a50299c1c57f6ec4855e3b6cb9b62fd7a08f42affd7242fb6a79afbf990019e')

package() {
  cd "$srcdir/passhole-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
