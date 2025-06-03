# Maintainer: Bastien Traverse <neitsab@archlinux.org>
# Contributor: Robert Manning <duckz@protonmail.ch>

pkgname=lightnovel-crawler-bin
pkgver=3.9.4
pkgrel=1
pkgdesc="An app to download novels from online sources and generate e-books (standalone bundle)"
arch=('x86_64')
url="https://github.com/dipu-bd/lightnovel-crawler"
license=('Apache-2.0')
depends=('zlib')
optdepends=('calibre: Output suport for docx, mobi, pdf, rtf, azw3, txt, fb2, lit, lrf, oeb, pdb, rb, snb, tcr')
provides=(lncrawl)
conflicts=(lncrawl)
source=("${url}/releases/download/v$pkgver/lncrawl-linux")
sha256sums=('6c01f8c18a8a491ff2713248c98960b41c1866f2b77d812c2d3d0cc3e458e77a')

package() {
  install -Dm755 ${srcdir}/lncrawl-linux ${pkgdir}/usr/bin/lncrawl
}
