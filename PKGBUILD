# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack-oc
pkgver=0.6.4
pkgrel=2
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}"
license=('AGPL')
depends=('nextcloud>=17.0' 'nextcloud<20.0')
makedepends=()
source=("${url}/-/archive/v${pkgver}/${_releasename}-v${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}-v${pkgver}
}

sha512sums=('572f013228dc97b35558a631baae1ac0ec0a28b266d84a5a0b6329b6472a7d9d2ea059bb318d983dd2edc7f3c08217c3361695ff4535705433307dd97622ecf1')
