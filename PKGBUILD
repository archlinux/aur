# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.7.0
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet')
conflicts=('featherwallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage' 'featherwallet-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('687965edccf12e751d60867b9caeafc8c0ca241bf01c728262d668aa4429eb42d9b8d2136936c29be3a593b201aa5422f62efaeaf1e994483214c83e26187faa'
            '0605a1ddf11e0effe03dfc8a8230f6b9297977cd8c6616c575dcf067cb3e71e0bb55e88a5a00760900027c433e76a07483afcd37409e214033aa07be3bb2b62a')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/usr/bin/feather"
}
