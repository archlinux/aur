# Maintainer: tee < teeaur at duck dot com >
pkgname=redbean
pkgver=0
pkgrel=5
pkgdesc='redbean is a single-file distributable web server that embeds Lua, SQLite, and MbedTLS'
arch=(x86_64)
url='https://cosmo.zip'
license=('ISC' 'MIT' 'BSD2' 'BSD3' 'zlib')
source=("https://cosmo.zip/pub/cosmos/bin/redbean")
sha256sums=('52647a7a3cda58173a1c3522c0319a924f6fdf4a3b9032cbc1241fb640bafce3')

package() {
    install -Dm0755 redbean -t "$pkgdir/usr/bin"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
