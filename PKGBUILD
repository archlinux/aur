# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=pgtidy-bin
pkgver=0.0.2
pkgrel=2
pkgdesc="PostgreSQL SQL formatter and linter"
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/pgtidy"
license=('MIT')
provides=('pgtidy')
conflicts=('pgtidy')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a778cef02ae586ab06b9974b7151e7091d21854a15e0b90aa64db9a1651026b2')
sha256sums_aarch64=('cdf7de1207875e972869291808f6733d67836b1ed3abad3b6376d2307ff92012')

package() {
    install -Dm755 "pgtidy" "$pkgdir/usr/bin/pgtidy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
