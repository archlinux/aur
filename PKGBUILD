# Maintainder: samedamci <samedamci@disroot.org>
pkgname=featherwallet-wow
pkgver=beta3
pkgrel=1
pkgdesc="Simple Wownero (WOW) wallet in Qt"
arch=('any')
url="https://featherwallet.org/wownero"
license=('BSD-3')
depends=()
makedepends=()
source=("https://featherwallet.org/files/releases-wow/linux/feather-wow-beta-3-linux.zip")
sha512sums=('e79338a19c70f3bed6f70b0385861df204720f6164c4bebbca768d41376e853bc2c942e12b93b91ac4f70d0c045394e9ccf422ddc16bca0ac83a7ad6a1fcf862')

package() {
	install -Dm755 "feather-wow" "$pkgdir/usr/bin/${pkgname}"
}
