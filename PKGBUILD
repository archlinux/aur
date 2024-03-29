# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=dive-cli-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Deployable Infrastructure for Virtually Effortless blockchain integration"
arch=('x86_64')
depends=('docker')
url="https://github.com/HugoByte/DIVE"
license=('Apache-2.0 License')
source=("$pkgname-${pkgver//_/-}.tar.gz::${url}/releases/download/v${pkgver//_/-}/dive-cli_v${pkgver//_/-}_linux_amd64.tar.gz" "$pkgname.install")
sha256sums=('259343c8fa2f4167e5791445b52d08ca8f79aa7ca56da942be7fe47fad1f2f27' '4c06ab378065181b1d32dd213b12fdcc3d6a912704ff94ece7a949becdb97a48')

install="$pkgname.install"

package() {
    install -Dm755 dive "$pkgdir/usr/bin/dive"
}

