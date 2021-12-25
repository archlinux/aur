# Maintainer: Shago Pavel <shgpavel@yandex.ru>

pkgname=go-etherium-latest
pkgver=1.10.14
pkgrel=1
_commit=1.10.14-11a3a350
pkgdesc='Official Go implementation of the Ethereum protocol'
arch=('x86_64')
url='https://geth.ethereum.org/'
license=('GPL3, LGPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=('geth')
conflicts=('geth')
replaces=('geth')
source=("https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-${_commit}.tar.gz")
sha256sums=('SKIP')

package() {
    cd geth-linux-amd64-${_commit}

    install -Dm755 -t "${pkgdir}"/usr/bin geth 
}
