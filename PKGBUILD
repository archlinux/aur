# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=wkhtmltox-bin
pkgver=0.12.6
pkgrel=3
pkgdesc="Convert HTML to PDF and various image formats using QtWebkit"
arch=("x86_64")
url="https://wkhtmltopdf.org"
license=("LGPL3")
provides=("wkhtmltopdf" "wkhtmltoimage")
conflicts=("wkhtmltox" "wkhtmltox-git" "wkhtmltopdf" "wkhtmltopdf-git")
optdepends=("xorg-server: wkhtmltox needs X or Xvfb to operate")
source=("$pkgname-$pkgver.pkg::https://github.com/wkhtmltopdf/packaging/releases/download/${pkgver}-${pkgrel}/wkhtmltox-${pkgver}-${pkgrel}.archlinux-x86_64.pkg.tar.xz")
sha256sums=('e84c2ef2c3d16eabd85a3dbb98195062910dfa66febca4f8ea58eb7445317242')

package() {
  mv usr "$pkgdir"
}
