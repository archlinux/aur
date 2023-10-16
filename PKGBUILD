# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=dive-cli-bin
pkgver=0.0.12_beta
pkgrel=1
pkgdesc="Deployable Infrastructure for Virtually Effortless blockchain integration"
arch=('x86_64')
depends=('docker')
url="https://github.com/HugoByte/DIVE"
license=('Apache-2.0 License')
source=("$pkgname-${pkgver//_/-}.tar.gz::${url}/releases/download/v${pkgver//_/-}/dive-cli_v${pkgver//_/-}_linux_amd64.tar.gz" "$pkgname.install")
sha256sums=('b6ba52767fbaec9ae82e61869c105d5f42d21edf04062a1b5a64df2195d12c80' '4c06ab378065181b1d32dd213b12fdcc3d6a912704ff94ece7a949becdb97a48')

install="$pkgname.install"

package() {
    install -Dm755 dive "$pkgdir/usr/bin/dive"
}

