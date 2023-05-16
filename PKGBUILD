# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

_extension=return-youtube-dislike
pkgname="chromium-extension-$_extension"
pkgver=3.0.0.9
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/noahvogt/return-youtube-dislike"
license=('GPL3')
source=("https://github.com/noahvogt/$_extension/releases/download/v$pkgver-$pkgrel/$_extension-$pkgver.crx")
noextract=("$pkgname-$pkgver.crx")
sha256sums=('05a93fa47325df54417ae8d215fe3b15802e1b09e38d4de87b93805b6d040d37')

build() {
    echo "{ \"external_crx\": \"/usr/share/$pkgname/$pkgname.crx\", \"external_version\": \"$pkgver\" }" > dhhncjeconphppfmkokhamjpjgkmaflf.json
}

package() {
    install -Dm644 "$_extension-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 dhhncjeconphppfmkokhamjpjgkmaflf.json "$pkgdir/usr/share/chromium/extensions/dhhncjeconphppfmkokhamjpjgkmaflf.json"
}
