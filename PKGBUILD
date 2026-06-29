# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=pgtidy-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="PostgreSQL SQL formatter and linter"
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/pgtidy"
license=('MIT')
provides=('pgtidy')
conflicts=('pgtidy')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f59b4b10c62058c88dbca434e6378f6a870d1ac0e4ae37e000f5d10855e9961d')
sha256sums_aarch64=('6c955843fb227c98d785b8c34ae3cc3ea3676f9b4c9b2897196e0b6e41ff1843')

package() {
    install -Dm755 "pgtidy" "$pkgdir/usr/bin/pgtidy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
