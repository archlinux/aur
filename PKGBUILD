# Maintainer: Fredrik Storm <fredrik@fldc.se>
pkgname=vialctl-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Set RGB color on Vial keyboards"
arch=('x86_64' 'aarch64')
url="https://github.com/fldc/vialctl"
license=('MIT')
depends=('hidapi')
provides=('vialctl')
conflicts=('vialctl')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/fldc/vialctl/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/fldc/vialctl/releases/download/v$pkgver/vialctl-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::https://github.com/fldc/vialctl/releases/download/v$pkgver/vialctl-v$pkgver-linux-aarch64.tar.gz")

package() {
    install -Dm755 vialctl "$pkgdir/usr/bin/vialctl"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('f68933e05b2f9076808b495f9157ff473c98e07c584662e2a058cc7218d149cb')
sha256sums_x86_64=('a7ef1da2185e3852afe314eb4581c294323def35bc10ac9de71271887d015849')
sha256sums_aarch64=('84f75951c2fac2cbea2fe59f6bc6f44d30edda9eab755f52eb85548510caa932')
