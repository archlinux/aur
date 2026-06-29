# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=pgtidy-bin
pkgver=0.0.1
pkgrel=2
pkgdesc="PostgreSQL SQL formatter and linter"
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/pgtidy"
license=('MIT')
provides=('pgtidy')
conflicts=('pgtidy')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d072d7d368397f0d1f07c2a752702fa7c5120d6b79f4ac949ca47830ef3d55b4')
sha256sums_aarch64=('ee4e7d71ec3e5486ecfc71259c43efcfd181a334adc2748b48a079b18448bc72')

package() {
    install -Dm755 "pgtidy" "$pkgdir/usr/bin/pgtidy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
