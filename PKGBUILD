# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

_extension=return-youtube-dislike
pkgname="chromium-extension-$_extension"
pkgver=3.0.0.10
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/noahvogt/return-youtube-dislike"
license=('GPL3')
source=("https://github.com/noahvogt/$_extension/releases/download/v$pkgver-$pkgrel/$_extension-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('d9738873b7d6d9932feb4828264cddc8fa8ec2b575a2e95ae8cb2ea3f7aab472')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > dhhncjeconphppfmkokhamjpjgkmaflf.json
}

package() {
    install -Dm644 "$_extension-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 dhhncjeconphppfmkokhamjpjgkmaflf.json "$pkgdir/usr/share/chromium/extensions/dhhncjeconphppfmkokhamjpjgkmaflf.json"
}
