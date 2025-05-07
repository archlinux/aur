# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
pkgver=12.10.1.133
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(mariadb-libs postgresql-libs sqlite)
source=("https://www.heidisql.com/downloads/releases/HeidiSQL_$pkgver.deb")
install="$pkgname.install"
sha256sums=('adca15355a72ccd4e17fecd6c9d0443d43bf968b74aa81aee7ab88698e1eae12')

package() {
  cd "${pkgdir}"
  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.zst"
}
