# Maintainer: blambin <blambinneng at gmail dot com>
pkgname=ipfs-paste
pkgver=0.0.1
pkgrel=1
pkgdesc="paste stdin and clipboard to ipfs http://ipfs.io"
arch=('x86_64' 'arm')
url="https://github.com/jbenet/ipfs-paste"
license=('MIT')
groups=()
depends=('go-ipfs' 'xsel')
makedepends=()
source=("https://raw.githubusercontent.com/jbenet/$pkgname/master/$pkgname")
md5sums=("3c9ad2b068ef5bb2b6b5d22c045530e7")
package() {
        chmod +x "$pkgname"
        mkdir -p ${pkgdir}/usr/bin/
	cp "$pkgname" ${pkgdir}/usr/bin/
}
