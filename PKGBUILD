# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-return-youtube-dislike
_extension=return-youtube-dislike
pkgver=3.0.0.6
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/noahvogt/return-youtube-dislike"
license=('GPL3')
source=("https://github.com/noahvogt/$_extension/releases/download/v$pkgver/$_extension-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('b009ec3528c12e1c1520a0803af412c7c7642ae274982e7611f27b0d3bca7bd6')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > dhhncjeconphppfmkokhamjpjgkmaflf.json
}

package() {
    install -Dm644 "$_extension-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 dhhncjeconphppfmkokhamjpjgkmaflf.json "$pkgdir/usr/share/chromium/extensions/dhhncjeconphppfmkokhamjpjgkmaflf.json"
}
