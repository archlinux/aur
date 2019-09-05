# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack
pkgver=0.5.2
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}-oc/"
license=('AGPL')
depends=('nextcloud>=16.0' 'nextcloud<17.0')
makedepends=()
source=("${url}wikis/uploads/2237d9c60da431f11934ec38155f2c8d/${_releasename}-${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}
}

sha256sums=('b72901f19c9ba7553d8e9c8179d34628394ae993abfd045f8a5058923215193c')
