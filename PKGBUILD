# Maintainer: Anton Melnikov <antonmelnikov at yandex dot ru>

pkgname=dion
pkgver=5.20.0
pkgrel=1
pkgdesc="Dion messenger"
arch=('x86_64')
url="https://diongo.ru/"
license=('custom')
depends=(
  'gtk3'
  'libnotify'
  'libnss_nis'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=(
  'libappindicator-gtk3: for showing desktop notifications'
)
source=("https://static.dion.vc/desktop_app/dion_${pkgver}_amd64.deb")
sha512sums=('7fcb8d993ca0745d41df774bf8f3b97b5240e1c0da1166aeccaed8d5293328e9233be926b1ea245565fa75372e43dd403b9bf4870f9b3a20ad8cd29717f37c54')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}
