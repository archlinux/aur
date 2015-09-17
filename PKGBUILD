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
pkgver='1.5.3'
source=('keefox.zip::https://addons.mozilla.org/firefox/downloads/file/350852/keefox-1.5.3-tb+fx-linux.xpi?src=api')
#@ --------------------------------------------
#@
md5sums=('ae694ee51911f0a25f4435f3bd2d699e')
sha384sums=('4a010e987f29ba8f6a4a48eafa7c3392675689724f45ed205fea16d13b31deaf7832ee28ba3c7b31e257b87a1f24d98d')
