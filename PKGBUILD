# Maintainer: scan
pkgname=keepass-plugin-rpc
pkgver=1.15.1
pkgrel=1
pkgdesc="RPC plugin for Keepass"
license=('GPL')
depends=("keepass>=2.48")
url="https://github.com/kee-org/keepassrpc"
source=(https://github.com/kee-org/keepassrpc/releases/download/v${pkgver}/KeePassRPC.plgx)
arch=(any)
sha256sums=('9caf76b48e376c6b87dfc12dee195e18aebd21daa664380b7cd7e6a8295ab56b')

package(){
   mkdir -p "${pkgdir}"/usr/share/keepass/Plugins
   install -m644 KeePassRPC.plgx "${pkgdir}"/usr/share/keepass/Plugins
}
