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
pkgver='1.6.4'
source=('https://addons.mozilla.org/firefox/downloads/file/539988/keefox-1.6.4-fx+tb-linux.xpi?src=api')
#@ --------------------------------------------
#@
sha384sums=('9d710cd7123bb78b862520df163e6fc032a27719198fa1f4036e8e2b4b00ae9d97f7a5fdcadf0df46334e2581702a252')
