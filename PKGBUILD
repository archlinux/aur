# Maintainer: Carlos Galindo <carlos.s.galindo@gmail.com>

pkgname=nextcloud-app-phonetrack
_releasename=phonetrack
pkgver=0.5.10
pkgrel=2
pkgdesc="Phone tracker and location sharer for Nextcloud"
arch=('any')
url="https://gitlab.com/eneiluj/${_releasename}-oc/"
license=('AGPL')
depends=('nextcloud>=17.0' 'nextcloud<18.0')
makedepends=()
source=("${url}-/wiki_pages/uploads/9306248f92bd66c1c44570ebc4eec1c3/${_releasename}-${pkgver}.tar.gz")

package() {
    install -d --owner=root --group=root $pkgdir/usr/share/webapps/nextcloud/apps/
    cp -r --target-directory=$pkgdir/usr/share/webapps/nextcloud/apps/ $srcdir/${_releasename}
}

sha256sums=('e5beeef3fbb14c67fbfa725f28530eede38b4b6504a4f8e8e5a5555f34680284')
