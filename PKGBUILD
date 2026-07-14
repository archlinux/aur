# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=tmetric-rpm
pkgver=20.2.4
pkgrel=2
pkgdesc="TMetric is a simple and accurate work time-tracker that sets you free from tedious time reporting. Built from the rpm to prevent breakage."
arch=('x86_64')
url="https://tmetric.com"
license=('LicenseRef-custom')
provides=('tmetric')
conflicts=('tmetric' 'tmetric-desktop')
options=('!strip' '!emptydirs')
# Upstream redirects this path to tmetric-desktop-${pkgver}.x86_64.rpm
source=("$pkgname-$pkgver.x86_64.rpm::https://static.tmetric.com/desktop/download/linux/rpm/x86_64")
sha256sums=('871a654c6e743a177b4fca6346571f8295e32b1122ea89bef876b6ef80a22848')

package() {
  cp -a usr "$pkgdir/"
}
