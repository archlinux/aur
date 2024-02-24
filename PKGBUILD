# Maintainer: tee < teeaur at duck dot com >
pkgname=redbean
pkgver=0
pkgrel=1
pkgdesc='redbean is a single-file distributable web server that embeds Lua, SQLite, and MbedTLS'
arch=(x86_64)
url='https://cosmo.zip'
license=('ISC' 'MIT' 'BSD2' 'BSD3' 'zlib')
source=("https://cosmo.zip/pub/cosmos/bin/redbean")
sha256sums=('51b761a8fcc64f7142333b1c188777ee53ea8c83cedc056e9107a212e7316d42')

package() {
    install -Dm0755 redbean -t "$pkgdir/usr/bin"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
