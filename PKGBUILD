# Maintainer: tee < teeaur at duck dot com >
pkgname=redbean
pkgver=0
pkgrel=3
pkgdesc='redbean is a single-file distributable web server that embeds Lua, SQLite, and MbedTLS'
arch=(x86_64)
url='https://cosmo.zip'
license=('ISC' 'MIT' 'BSD2' 'BSD3' 'zlib')
source=("https://cosmo.zip/pub/cosmos/bin/redbean")
sha256sums=('e4d262f1dabbe7cef9ef76cb4e30dd978d4fcca631f9cc59a21e5b4f9ff2746f')

package() {
    install -Dm0755 redbean -t "$pkgdir/usr/bin"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
