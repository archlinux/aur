# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgrel=1
epoch=1
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
pkgver='1.7.2'
source=('https://addons.mozilla.org/firefox/downloads/file/715252/keefox-1.7.2-fx+tb-linux.xpi?src=api')
#@ --------------------------------------------
#@
sha384sums=('2addcc7894502e63814a986e7bc5f07533f88164a16b58e2cd7b2bc2fb4dac529420eb7653d7d4170bf2fcf2d6fc028d')
