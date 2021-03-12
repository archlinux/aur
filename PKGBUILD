# Maintainder: samedamci <samedamci@disroot.org>
pkgname=featherwallet
pkgver=beta4
pkgrel=1
pkgdesc="Simple Monero (XMR) wallet in Qt"
arch=('any')
url="https://featherwallet.org/"
license=('BSD-3')
depends=()
makedepends=()
source=("https://featherwallet.org/files/releases/linux/feather-beta-4-linux.zip")
sha512sums=('bf90dc50dd85ff363d9179c1faea1c7281e69764e36b5b848fce5cade198b3f712f80da779dc69d9ea7dcf19e471da93a1be3f975c165379a3d96839f219c4c4')

package() {
	# cd "$pkgname-$pkgver" || exit 1

	install -Dm755 "feather-beta-4" "$pkgdir/usr/bin/${pkgname}"
}
