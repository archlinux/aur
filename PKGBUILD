# Maintainer: Bastien Traverse <neitsab@archlinux.org>
# Contributor: Robert Manning <duckz@protonmail.ch>

pkgname=lightnovel-crawler-bin
pkgver=3.10.1
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
sha256sums=('86fe3fe64d5d6d0389f5a54eb2b9b81f80f5618766bafae9a61696fdc012aecb')

package() {
  install -Dm755 ${srcdir}/lncrawl-linux ${pkgdir}/usr/bin/lncrawl
}
