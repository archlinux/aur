# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=1.16.0
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass>=2.48")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v${pkgver}/KeePassRPC.plgx)
arch=(any)
sha256sums=('a7975896e0ab5c02a1061966eac43741013780b309cc466c1d7c069d5797168b')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
