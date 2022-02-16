pkgname=dapr-cli-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64')
url='https://github.com/dapr/cli'
license=('Apache')
options=('!strip' '!emptydirs')
source=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
sha256sums=('a1b4dbb3a8bf9746951f5c9889d8ddb08f28f931c10c396b82ce4362eea92198')
provides=('dapr')

package() {
    install -Dm755 "dapr" "$pkgdir/usr/bin/dapr"
}

