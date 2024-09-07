# Maintainer: tee < teeaur at duck dot com >
pkgname=redbean
pkgver=3.0.0
pkgrel=1
pkgdesc='redbean is a single-file distributable web server that embeds Lua, SQLite, and MbedTLS'
arch=(x86_64)
url='https://redbean.dev'
license=('ISC' 'MIT' 'BSD2' 'BSD3' 'zlib')
source=("https://redbean.dev/redbean-$pkgver.com")
sha256sums=('382f1288bb96ace4bab5145e7df236846c33cc4f1be69233710682a9e71e7467')

package() {
    install -Dm0755 redbean-$pkgver.com "$pkgdir/usr/bin/redbean"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
