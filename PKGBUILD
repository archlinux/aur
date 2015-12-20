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
pkgver='1.5.4'
source=('https://addons.mozilla.org/firefox/downloads/file/374446/keefox-1.5.4-tb+fx-linux.xpi?src=api')
#@ --------------------------------------------
#@
md5sums=('f3434ecfac0f3a1c07f7eff3e5b32cf2')
sha384sums=('6c8d8c8ce69f2f9d92bfef0d3346326e98a4fccec123da6285bcdf991974b830fbde680ea01acf0e25c3016f6dc5634e')
