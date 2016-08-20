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
pkgver='1.6.3'
source=('https://addons.mozilla.org/firefox/downloads/file/485354/keefox-1.6.3-fx+tb-linux.xpi?src=api')
#@ --------------------------------------------
#@
sha384sums=('fde2e1e985d43e4f8064371a652e83512fd24561e1233c495ea50f999bc7b31f24f7c354363e8b81fafca5fbe21a1e29')
