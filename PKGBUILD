# Maintainer: blambin <blambinneng at gmail dot com>
pkgname=ipfs-screencap
pkgver=0.0.1
pkgrel=1
pkgdesc="Capture screenshots, publish them to IPFS, and copy the link to the clipboard. http://ipfs.io"
arch=('x86_64' 'arm')
url="https://github.com/jbenet/ipfs-screencap"
license=('MIT')
groups=()
depends=('go-ipfs' 'xsel')
makedepends=()
source=("${pkgname%-git}::git+https://github.com/jbenet/$pkgname")
md5sums=("SKIP")
package() {
        pwd
        cd "$pkgname"
        mkdir -p ${pkgdir}/usr/bin/
	    cp ./portable-screencap ${pkgdir}/usr/bin/
        cp ./ipfs-screencap ${pkgdir}/usr/bin/
}
