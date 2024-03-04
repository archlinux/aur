# Maintainer: tee < teeaur at duck dot com >
pkgname=redbean
pkgver=0
pkgrel=2
pkgdesc='redbean is a single-file distributable web server that embeds Lua, SQLite, and MbedTLS'
arch=(x86_64)
url='https://cosmo.zip'
license=('ISC' 'MIT' 'BSD2' 'BSD3' 'zlib')
source=("https://cosmo.zip/pub/cosmos/bin/redbean")
sha256sums=('e6b06b7b4e719fcff73b04be8b95269ff47f6f836790c50aec05116dd9efe937')

package() {
    install -Dm0755 redbean -t "$pkgdir/usr/bin"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
