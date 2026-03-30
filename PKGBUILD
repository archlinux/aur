# Maintainer: Fredrik Storm <fredrik@fldc.se>
pkgname=nuphyctl-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Rust CLI for sending NuPhy keyboard HID commands"
arch=('x86_64' 'aarch64')
url="https://github.com/fldc/nuphyctl"
license=('MIT')
depends=('hidapi')
provides=('nuphyctl')
conflicts=('nuphyctl')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/fldc/nuphyctl/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-aarch64.tar.gz::https://github.com/fldc/nuphyctl/releases/download/v$pkgver/nuphyctl-v$pkgver-linux-aarch64.tar.gz")

package() {
    install -Dm755 nuphyctl "$pkgdir/usr/bin/nuphyctl"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('f68933e05b2f9076808b495f9157ff473c98e07c584662e2a058cc7218d149cb')
sha256sums_x86_64=('72f10053bc3063e55964ec589a92a5590993e487e746e6063e6d04952e2f7ad9')
sha256sums_aarch64=('2d2737af624e544ffb87d6abe2d24bba454eead0db71479df1622d5f8be78edb')
