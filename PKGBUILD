# Maintainer: Microoo <hu@microoo.net>
pkgname=substratumnode
pkgver=0.4.0
pkgrel=2
pkgdesc="SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-git')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v0.4.0/SubstratumNode-v0.4.0-Linux64-deb.zip")
sha256sums=('017552ee88a8572348d27d1fc0c0eba771c386cb7d1e0095d2268d0f9ca5eb4b')

package(){

    # Extract deb file
    bsdtar -xf "SubstratumNode_0.4.0_amd64.deb"
    
    # Extract package data
    tar xf "data.tar.xz" -C "${pkgdir}"

}
