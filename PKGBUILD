# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=recycle-cli
pkgver=2021.01.01
pkgrel=1
pkgdesc='A recycle bin cli in python 3'
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/recycle-cli/"
license=('CC BY-NC-SA 4.0')
depends=('coreutils' 'gettext' 'python>=3.4')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('adf5c2659cec7ea4f1090c069dfdc64e9a9e988c0cafcd5e0271aac2e02321a0')

package() {
  mkdir -p $pkgdir/usr
  cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
}
