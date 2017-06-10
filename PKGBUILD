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
pkgver='1.7.0'
source=('https://addons.mozilla.org/firefox/downloads/file/659059/keefox-1.7.0-fx+tb-linux.xpi?src=api')
#@ --------------------------------------------
#@
sha384sums=('40dab624c1deda7342d09c9a4107533f38439be6f68dc7353da9e9ab054343169890e44a245e805a660681e4ce9e1cb5')
