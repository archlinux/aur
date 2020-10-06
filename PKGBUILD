# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=g2ttrss-mobile
pkgver=20151113
pkgrel=2
pkgdesc='A Google inspired mobile interface for TT-RSS.'
arch=(any)
url='https://github.com/g2ttrss/g2ttrss-mobile'
license=(unknown)
depends=('tt-rss')
_commit=c5af46ebf64076e4c62c978551fa749af268710b
source=("https://github.com/g2ttrss/g2ttrss-mobile/archive/${_commit}.zip")
sha256sums=('79dd8d50a337f0e8920283d33b73a86d118edf421fc2e9f2ed1c54d7898ed095')

package() {
  mkdir -p "$pkgdir/usr/share/webapps/tt-rss/"
  cp -R "${pkgname}-${_commit}" "$pkgdir/usr/share/webapps/tt-rss/g2ttrss-mobile"
}