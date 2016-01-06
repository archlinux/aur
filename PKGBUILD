# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pdfjs
pkgver=1.2.109
pkgrel=2
pkgdesc="PDF reader in javascript"
arch=('any')
url="https://mozilla.github.io/pdf.js/"
license=('Apache')
source=("https://github.com/mozilla/pdf.js/releases/download/v${pkgver}/pdfjs-${pkgver}-dist.zip")
sha1sums=('d100bc48123154ad97530728ebfef312b5883f94')

package() {
  mkdir -p "$pkgdir/usr/share/pdf.js"
  cp -R "$srcdir"/{LICENSE,build,web} "$pkgdir/usr/share/pdf.js"
}

# vim:set ts=2 sw=2 ft=sh et:
