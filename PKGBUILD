# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack-oc
pkgver=0.6.5
pkgrel=1
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}"
license=('AGPL')
depends=('nextcloud')
makedepends=()
source=("${url}/-/archive/v${pkgver}/${_releasename}-v${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}-v${pkgver}
}

sha512sums=('e561f40500ec9b47a4d9936342ca07cd802c496066262bdc620c0c805a4e02e5f72c15573debf8bd8292426525dbba1eac3ee46e905b9d2afbb103944caf5c74')
