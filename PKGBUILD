# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=5.2.0.0
pkgrel=2
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_1225e57e3b4b4c4582f654f782&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python')
makedepends=("python-pip")
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-redfish-utility/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0d21c94a214145691aeb14cc1ac1d86292840a59602e06f721265dcd6d46c889')
changelog=ChangeLog

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
