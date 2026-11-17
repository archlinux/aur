# Maintainer: mAmineChniti <emin.chniti@esprit.tn>
pkgname=shakedown-cli
pkgver=0.1.2
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
sha256sums_x86_64=('b0714c9399eb8e580dde2129009d75fd48686673855dc89f435e59b5cffeb11a')
sha256sums_aarch64=('350305c127b08c84b304c8bde16e624493fdbe65a92cd10ac0ee08a247142891')

package() {
	install -Dm755 "$srcdir/shakedown-$pkgver" "$pkgdir/usr/bin/shakedown"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
