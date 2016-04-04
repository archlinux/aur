# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgrel=2
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(any)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
install="${pkgname}.install"

package() {
    cd "$srcdir/deps"

    install -m 644 -D KeePassRPC.plgx "${pkgdir}/usr/share/keepass/plugins/KeePassRPC.plgx"
}

_amo_id=306880
_amo_os=Linux
#@
#@ --------------------------------------------
#@ Lines below automatically added by update_pkgbuild.sh.
pkgver='1.6.0'
source=('https://addons.mozilla.org/firefox/downloads/file/420502/keefox-1.6.0-tb+fx-linux.xpi?src=api')
#@ --------------------------------------------
#@
md5sums=('3ba40cae72dadcdd3597b04c829eb93b')
sha384sums=('78e354dbb337c80de16e719f31d227a5b862fb8f53d71a4f7c89d4a86fb3984fd9f9b482b2aa80b75bafcccac929bb68')
