# Maintainer: Microoo <hu@microoo.net>
pkgname=substratumnode
pkgver=0.4.2
pkgrel=1
pkgdesc="SubstratumNode is the foundation of the decentralized SubstratumNetwork. SubstratumNodes work together to relay CORES packages and content on the network."
arch=('x86_64')
url="https://substratum.net"
license=('GPLv3')
depends=()
conflicts=('substratumnode-git')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://s3.us-east-2.amazonaws.com/substratum-website-downloads/v0.4.2/SubstratumNode-v0.4.2-Linux64-deb.zip")
sha256sums=('3a277da7dd316155c41adb57f4c14b47dba46166bfabc9e74e410cd57366bf9a')

package(){

    # Extract deb file
    bsdtar -xf "SubstratumNode_0.4.2_amd64.deb"
    
    # Extract package data
    tar xf "data.tar.xz" -C "${pkgdir}"

}
