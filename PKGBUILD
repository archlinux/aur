# Maintainer: atomicfs

pkgname=tt-rss-data-migration-git
_gitname=ttrss-data-migration
pkgver=1.0.0
pkgrel=1
pkgdesc="TT-RSS plugin to import and export all articles"
arch=('any')
url="https://dev.tt-rss.org/tt-rss/ttrss-data-migration"
license=('GPL3')
depends=('tt-rss')
makedepends=('git')
provides=('tt-rss-data-migration')
conflicts=('tt-rss-data-migration')
source=('git+https://dev.tt-rss.org/tt-rss/ttrss-data-migration.git')
md5sums=('SKIP')

package() {
  _instdir="$pkgdir/usr/share/webapps/tt-rss/plugins.local/data_migration"
  install -dm755 "$_instdir"
  install -vDm644 "$_gitname/init.php" "$_instdir/"
  install -vDm644 "$_gitname/README.md" "$_instdir/"
}

