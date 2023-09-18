# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver='1.10.0' # renovate: datasource=github-tags depName=Evidlo/passhole
pkgrel=2
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
url="https://github.com/Evidlo/passhole"
makedepends=('python-setuptools' 'git')
depends=("python-pynput" "python-pykeepass" "python-pykeepass_cache" "python-colorama" "python-future" "python-pyotp" )
source=("https://github.com/Evidlo/passhole/archive/v$pkgver.tar.gz")
sha512sums=('7a23553026033ec37be90ae5bbac11063322b4e87774f4b4dadf1e2da1bc750548500cafdaa6ddb4eb1487d0cf2d635a14c1e7145a6c53e44fdf4bae64610973')

package() {
  cd "$srcdir/passhole-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
