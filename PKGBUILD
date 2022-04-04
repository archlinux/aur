# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname=chromium-extension-return-youtube-dislike
_extension=return-youtube-dislike
pkgver=2.1.0.3
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/noahvogt/return-youtube-dislike"
license=('GPL3')
source=("https://github.com/noahvogt/$_extension/releases/download/v2.1.0.3/$_extension-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('c383bb218995dc497e91cc47ee3c82d6c8a9532f5f83aa7b8d885aadb4559020')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > dhhncjeconphppfmkokhamjpjgkmaflf.json
}

package() {
    install -Dm644 "$_extension-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 dhhncjeconphppfmkokhamjpjgkmaflf.json "$pkgdir/usr/share/chromium/extensions/dhhncjeconphppfmkokhamjpjgkmaflf.json"
}
