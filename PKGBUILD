# Maintainer: Tilman Blumenbach <tilman AT ax86 DOT net>

pkgname=keepass-plugin-rpc
pkgrel=1
pkgdesc="RPC plugin for Keepass (used by the KeeFox addon for Firefox)"
arch=(i686 x86_64)
url="http://keefox.org/"
license=('GPL')
depends=(keepass)
makedepends=(unzip)
install="${pkgname}.install"
noextract=(keefox.zip)

prepare() {
    cd "$srcdir"

    unzip -qd keefox keefox.zip
}

package() {
    cd "$srcdir/keefox/deps"

    install -m 644 -D KeePassRPC.plgx "${pkgdir}/usr/share/keepass/plugins/KeePassRPC.plgx"
}

_amo_id=306880
_amo_os=Linux
_amo_url_prefix="keefox.zip::"
#@
#@ --------------------------------------------
#@ Lines below automatically added by update_pkgbuild.sh.
pkgver='1.4.8.1_signed'
source=('keefox.zip::https://addons.mozilla.org/firefox/downloads/file/318702/keefox-1.4.8-tb+fx-linux.xpi?src=api')
#@ --------------------------------------------
#@
md5sums=('d5f6670c9bb3179b1ad87fd7cb170669')
sha384sums=('4111b1346b90b4533a95df3bad0846f1948c5c8985c3304461b5172eb6da9a8a6a1c634dc46cbbd470b05e5f9c6fe517')
