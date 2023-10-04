# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=dive-cli-bin
pkgver=0.0.11_beta
pkgrel=1
pkgdesc="Deployable Infrastructure for Virtually Effortless blockchain integration"
arch=('x86_64')
depends=('docker')
url="https://github.com/HugoByte/DIVE"
license=('Apache-2.0 License')
source=("$pkgname-${pkgver//_/-}.tar.gz::${url}/releases/download/v${pkgver//_/-}/dive-cli_v${pkgver//_/-}_linux_amd64.tar.gz" "$pkgname.install")
sha256sums=('8d10da09e1c194d9f4180ed20898e692dfb18aced7a2450d2743f5f4302e8652' '4c06ab378065181b1d32dd213b12fdcc3d6a912704ff94ece7a949becdb97a48')

install="$pkgname.install"

package() {
    install -Dm755 dive "$pkgdir/usr/bin/dive"
}

