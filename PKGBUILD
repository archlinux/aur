# Maintainer: amine <emin.chniti@esprit.tn>
pkgname=shakedown-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Migration rehearsal for databases"
arch=('x86_64' 'aarch64')
url="https://github.com/mAmineChniti/shakedown"
license=('MIT')
depends=()
source=("LICENSE::https://raw.githubusercontent.com/mAmineChniti/shakedown/v$pkgver/LICENSE")
source_x86_64=("shakedown-$pkgver::https://github.com/mAmineChniti/shakedown/releases/download/v$pkgver/shakedown_linux_amd64")
source_aarch64=("shakedown-$pkgver::https://github.com/mAmineChniti/shakedown/releases/download/v$pkgver/shakedown_linux_arm64")
sha256sums=('ada32f307add72348b36666c2453425f65950cc2e7247c527adad4ba1f0a7d29')
sha256sums_x86_64=('06ab0dc4693f6b6359ca87c9c8d12ded47f39ed5ed021163df17e3cd15e784c2')
sha256sums_aarch64=('cd4d23a18ed2c59061dc93b6c3bb2254d29e46483d6e7e5ba9e294db865a6970')

package() {
  install -Dm755 "$srcdir/shakedown-$pkgver" "$pkgdir/usr/bin/shakedown"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
