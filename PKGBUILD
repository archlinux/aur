# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack-oc
pkgver=0.6.3
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}"
license=('AGPL')
depends=('nextcloud>=17.0' 'nextcloud<19.0')
makedepends=()
source=("${url}/-/archive/v${pkgver}/${_releasename}-v${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}-v${pkgver}
}

sha512sums=('3eed4f5521bce1835de3dabaef848132305bfd3facb3e9fe369e2bf3202d012583a3f65e1c39d934fa5adf5c8e2f1aa0e89f93be234daf932c35f6074fa76435')
