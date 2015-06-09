# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=wsyster
pkgver=02
pkgrel=1
pkgdesc="Extract audio samples from .aw files using metadata in .wsys files"
arch=(i686 x86_64)
url="http://hcs64.com/files/"
license=(GPL)
source=("http://hcs64.com/files/${pkgname}${pkgver}.zip")
sha512sums=('739edbf309f97a779dd52567cfc5c9b507dc55c492e6f16d03a6c6823451d1c443494d275bfe391c271718367e64fc707c680df1adf097a31647e395423b1afd')

build() {
  gcc -o wsyster wsyster.c
}

package() {
  install -Dm755 wsyster "${pkgdir}/usr/bin/wsyster"
}
