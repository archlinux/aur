# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=owncloud-app-gallery-plus
pkgver=15.1.1
pkgrel=1
pkgdesc="Fork of the official next-gen Gallery app for ownCloud by the same maintainer"
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=169116"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/interfasys/galleryplus/releases/download/v15.1.1-stable9/galleryplus-v15.1.1-stable9.tar.gz")
md5sums=('5686685dfc0b452278774058b080d99c')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/galleryplus ${pkgdir}/usr/share/webapps/owncloud/apps/galleryplus
}
