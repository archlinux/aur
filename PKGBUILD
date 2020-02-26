# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack
pkgver=0.6.2
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}-oc/"
license=('AGPL')
depends=('nextcloud>=17.0' 'nextcloud<19.0')
makedepends=()
source=("${url}wikis/uploads/7c0da5d24e4f0a358d1ac951d84f9bff/${_releasename}-${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}
}

sha256sums=('920fcab005bb09c45321f5a1731144b338d5a93b96b402057e9eec277870be4c')
