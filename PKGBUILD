# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=owncloud-app-files-move
pkgver=0.8.2
pkgrel=1
pkgdesc="Move dialog integrated in the owncloud-file-manager"
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=150271"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://apps.owncloud.com/CONTENT/content-files/150271-files_mv.tar.gz")
sha256sum=('1a987614b55ad2211c9f7fbe1191cb78')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/files_mv ${pkgdir}/usr/share/webapps/owncloud/apps/files_mv
}
md5sums=('534e30d8335d0fe17a20ab2cb17a4b3a')
