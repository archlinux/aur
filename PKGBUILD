# Maintainer: Microoo <hu@microoo.net>
pkgname=substratumnode
pkgver=0.4.1
pkgrel=1
pkgdesc="SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-git')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v0.4.1/SubstratumNode-v0.4.1-Linux64-deb.zip")
sha256sums=('c5c9b1ef9ac1b2acc52c03c79afcf19bfd06f4c286388d139cfdfca5a1b267ee')

package(){

    # Extract deb file
    bsdtar -xf "SubstratumNode_0.4.1_amd64.deb"
    
    # Extract package data
    tar xf "data.tar.xz" -C "${pkgdir}"

}
