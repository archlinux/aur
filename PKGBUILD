# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
pkgver=12.11.1.167
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(gtk2 mariadb-libs postgresql-libs sqlite)
source=("https://www.heidisql.com/downloads/releases/HeidiSQL_$pkgver.deb")
install="$pkgname.install"
sha256sums=('98a4c24c549175f10abbfbde0352895c6914f87fa88b14f6cbfa0d2efd475e22')

package() {
  cd "${pkgdir}"
  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.zst"
}
