# Maintainer: Tom Richards <tom@tomrichards.net>

pkgname=libpdfium-bin
pkgver=20151208.015427
pkgrel=1
pkgdesc="An open-source PDF rendering engine."
arch=('x86_64')
url="https://pdfium.googlesource.com/pdfium.git"
license=('GPL')
depends=('freetype2' 'freeimage')
source=("https://assets.documentcloud.org/pdfium/libpdfium-dev_${pkgver}_amd64.deb")
sha256sums=('971bd440bdb351922a78b8c2e10c434ee06345325f52823e1c0cc2589bd5bec8')

build() {
    tar xvf data.tar.xz
    rm -rf ./usr/share
}

package() {
    cp -R usr "$pkgdir/"
}
