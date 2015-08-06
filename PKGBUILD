# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-libpdfium-bin
pkgname=libpdfium-bin
pkgver=0.1+git20150311
pkgrel=1
pkgdesc="An open-source PDF rendering engine."
arch=('x86_64')
url="https://pdfium.googlesource.com/pdfium.git"
license=('GPL')
depends=('freetype2' 'freeimage')
source=('http://s3.documentcloud.org.s3.amazonaws.com/pdfium/libpdfium-dev_0.1%2Bgit20150311-1_amd64.deb')
sha256sums=('0a25d618c99d441f7112b098ec4be9e8d49f8672b7647d402c6db860852919b3')

build() {
    tar xvf data.tar.xz
    rm -rf ./usr/share
}

package() {
    cp -R usr "$pkgdir/"
}
