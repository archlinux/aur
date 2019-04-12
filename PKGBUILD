# Maintainer: Microoo <hu _AT_ m i c r o o o _DOT_ net>
pkgname=substratumnode
pkgver=0.4.4
pkgrel=1
pkgdesc="SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-git')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v${pkgver}/SubstratumNode-v${pkgver}-Linux64-deb.zip")
sha256sums=('a19f1af50acbb84050a10afbe6c6930ae76bc3b39a831865e4b4e244af01103a')

package(){

    # Extract deb file
    bsdtar -xf "SubstratumNode_${pkgver}_amd64.deb"
    
    # Extract package data
    tar xf "data.tar.xz" -C "${pkgdir}"

}
