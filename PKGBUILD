# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-news
pkgver=7.1.0
pkgrel=1
pkgdesc="An RSS/Atom feed reader"
arch=('any')
url="https://github.com/owncloud/news"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("https://github.com/owncloud/news/archive/${pkgver}.tar.gz")
sha512sums=("e6570deef6ca95a86ff2e323f54d2fca9f845307d6bcaaade3dd27fe69cc5d64c7c8c0e249cda5b5ec9886a79dd36e68524670db6388b4db47c712e6e14a7bac")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/news-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/news"
}
