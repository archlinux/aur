# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

# binary version of this package (-bin): github.com/noahvogt/chromium-extension-return-youtube-dislike-bin

_extension=return-youtube-dislike
pkgname="chromium-extension-$_extension"
pkgver=3.0.0.14
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/noahvogt/return-youtube-dislike"
license=('GPL3')
source=("https://github.com/noahvogt/$_extension/releases/download/v$pkgver-$pkgrel/$_extension-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('bf9f304dce9fcb04d5c174a6221daaaccd48812590f2db65d8907667b1b56e77')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > dhhncjeconphppfmkokhamjpjgkmaflf.json
}

package() {
    install -Dm644 "$_extension-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 dhhncjeconphppfmkokhamjpjgkmaflf.json "$pkgdir/usr/share/chromium/extensions/dhhncjeconphppfmkokhamjpjgkmaflf.json"
}
