pkgname=dapr-cli-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64')
url='https://github.com/dapr/cli'
license=('Apache')
options=('!strip' '!emptydirs')
source=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
sha256sums=('896f1d7b1c244f06311354162b53b048885152df93c1a94abf06c76ac6837de6')
provides=('dapr')

package() {
    install -Dm755 "dapr" "$pkgdir/usr/bin/dapr"
}

