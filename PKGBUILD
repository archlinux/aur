# Maintainer: Amine Chniti <emin.chniti@esprit.tn>
pkgname=shakedown-cli
pkgver=0.2.0
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
sha256sums_x86_64=('d543b00541a10b22373fd1b2a3296491950369e60b5c8f0bf4440b14b668d925')
sha256sums_aarch64=('516848c263226df0dddf7ffca8ea710f748f5dbe5260e1393de904d752b9b488')

package() {
	install -Dm755 "$srcdir/shakedown-$pkgver" "$pkgdir/usr/bin/shakedown"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}