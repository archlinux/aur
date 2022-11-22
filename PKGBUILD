# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-return-youtube-dislike
_extension=return-youtube-dislike
pkgver=3.0.0.7
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/noahvogt/return-youtube-dislike"
license=('GPL3')
source=("https://github.com/noahvogt/$_extension/releases/download/v$pkgver/$_extension-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('e90399dfa588d83264205139389334c909e86ed079b4a555c4888d51d152e180')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > dhhncjeconphppfmkokhamjpjgkmaflf.json
}

package() {
    install -Dm644 "$_extension-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 dhhncjeconphppfmkokhamjpjgkmaflf.json "$pkgdir/usr/share/chromium/extensions/dhhncjeconphppfmkokhamjpjgkmaflf.json"
}
