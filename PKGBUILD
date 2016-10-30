# Maintainer : Immae <ismael.bouya@normalesup.org>

pkgname=owncloud-app-share-links
pkgver=1.1.0
pkgrel=1
pkgdesc="An app which adds additional buttons to the ownCloud share dialogue if you're using the Gallery app, letting you quickly pick the type of link you need."
arch=('any')
url="https://apps.owncloud.com/content/show.php?content=170527"
license=('GPL')
depends=('owncloud' 'owncloud-app-gallery-plus')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/interfasys/sharelinks/releases/download/v1.1-stable8.2/sharelinks-v1.1-stable8.2.zip")
md5sums=('068f18f13aaee38d75575d7beb35cd61')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/sharelinks ${pkgdir}/usr/share/webapps/owncloud/apps/sharelinks
}
