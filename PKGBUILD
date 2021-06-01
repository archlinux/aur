# Maintainer: Robert Manning <duckz@protonmail.ch>

pkgname=lightnovel-crawler-bin
pkgver=2.26.3
pkgrel=6
pkgdesc="An app to download novels from online sources and generate e-books."
arch=('any')
url="https://github.com/dipu-bd/lightnovel-crawler.git"
license=('Apache')
depends=(zlib)
optdepends=('calibre: Output suport for docx, mobi, pdf, rtf, azw3, txt, fb2, lit, lrf, oeb, pdb, rb, snb, tcr')
provides=(lncrawl)
conflicts=(lncrawl)

source=("https://github.com/dipu-bd/lightnovel-crawler/releases/download/v$pkgver/lncrawl-$pkgver-linux")
md5sums=('033f1f00a8588eecf67546ef201fe7aa')
sha1sums=('6abbdc56c43459bfb2b7846a1678d86303666613')
sha256sums=('72ba156a06082964523c400476d23558e3ab39416341f01a4ca079295ec29199')


package() {
  install -Dm755 ${startdir}/lncrawl-$pkgver-linux ${pkgdir}/usr/bin/lncrawl
}
