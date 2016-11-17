pkgname=onlyoffice-bin
pkgver=4.1.2
pkgrel=33
pkgdesc='The most complete and feature-rich office and productivity suite'
arch=('x86_64')
url='http://www.onlyoffice.com/'
depends=("libx11" "libxss" "curl" "gtkglext" "cairo" "libstdc++5" "ttf-dejavu" "ttf-liberation" "libcurl-gnutls")
license=('AGPL-3.0')
source=("http://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  ar xf "onlyoffice-desktopeditors_amd64.deb"
  tar xf data.tar.xz -C "$pkgdir"
}