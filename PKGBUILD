# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pdfjs
pkgver=1.9.426
pkgrel=1
pkgdesc="PDF reader in javascript"
arch=('any')
url="https://mozilla.github.io/pdf.js/"
license=('Apache')
source=("https://github.com/mozilla/pdf.js/releases/download/v${pkgver}/pdfjs-${pkgver}-dist.zip")
sha1sums=('64d1103f793cffeb1f1fe6040ec49519421919ce')

package() {
  mkdir -p "$pkgdir/usr/share/pdf.js"
  cp -R "$srcdir"/{LICENSE,build,web} "$pkgdir/usr/share/pdf.js"
}

# vim:set ts=2 sw=2 ft=sh et:
