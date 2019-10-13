# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack
pkgver=0.5.4
pkgrel=2
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}-oc/"
license=('AGPL')
depends=('nextcloud>=17.0' 'nextcloud<18.0')
makedepends=()
source=("${url}wikis/uploads/91111eb4eb493bdc591334b190a4f935/${_releasename}-${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}
}

sha256sums=('d6bc8a93e4d3a210b4694ac1d521efa1a5c61535b90c02a9fb3ee59b2ffcf23c')
