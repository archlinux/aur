# Maintainer: Robert Manning <duckz@protonmail.ch>

pkgname=lightnovel-crawler-bin
pkgver=v2.25.1
pkgrel=2
pkgdesc="An app to download novels from online sources and generate e-books."
arch=('any')
url="https://github.com/dipu-bd/lightnovel-crawler.git"
license=('Apache')
depends=(zlib)
optdepends=('calibre: Output suport for docx, mobi, pdf, rtf, azw3, txt, fb2, lit, lrf, oeb, pdb, rb, snb, tcr')
provides=(lncrawl)
conflicts=(lncrawl)

source=("https://github.com/dipu-bd/lightnovel-crawler/releases/download/$pkgver/lncrawl")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

package() {
  install -Dm755 lncrawl ${pkgdir}/usr/bin/lncrawl
}
