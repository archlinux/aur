# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack
pkgver=0.5.11
pkgrel=2
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}-oc/"
license=('AGPL')
depends=('nextcloud>=17.0' 'nextcloud<19.0')
makedepends=()
source=("${url}wikis/uploads/a1517d4a406a2fd609f869f54cc88f85/${_releasename}-${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}
}

sha256sums=('cd219e9424880e8575d403660f8a8bac377d764ec3a7fed154119d089995ec24')
