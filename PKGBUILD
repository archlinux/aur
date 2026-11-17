# Maintainer: mAmineChniti <emin.chniti@esprit.tn>
pkgname=shakedown-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="Migration rehearsal for databases"
arch=('x86_64' 'aarch64')
url="https://github.com/mAmineChniti/shakedown"
license=('MIT')
depends=()
source=('LICENSE')
source_x86_64=("shakedown-$pkgver::https://github.com/mAmineChniti/shakedown/releases/download/v$pkgver/shakedown_linux_amd64")
source_aarch64=("shakedown-$pkgver::https://github.com/mAmineChniti/shakedown/releases/download/v$pkgver/shakedown_linux_arm64")
sha256sums=('ada32f307add72348b36666c2453425f65950cc2e7247c527adad4ba1f0a7d29')
sha256sums_x86_64=('94e9ee02dc62748f4e07b7caccaf0f1bacad926548ed6e2c9ac86eeaf40b37ca')
sha256sums_aarch64=('c7f6f2902bb5e40f049f2c6d4a451857d73cf83f55026e38513858e9c68381ce')

package() {
	install -Dm755 "$srcdir/shakedown-$pkgver" "$pkgdir/usr/bin/shakedown"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
