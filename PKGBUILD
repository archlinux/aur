# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.7.0
pkgrel=3
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet' 'feather-wallet')
conflicts=('featherwallet' 'featherwallet-appimage' 'feather-wallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "LICENSE-$pkgver-$pkgrel::https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('687965edccf12e751d60867b9caeafc8c0ca241bf01c728262d668aa4429eb42d9b8d2136936c29be3a593b201aa5422f62efaeaf1e994483214c83e26187faa'
            'dc6652639f2b223a44d7c67807a36749ee0d1807d70c7d3e9b27a53566fe5a32f44b121c0deb2df466491b223f5a7aa87880d3544681d5ee308752f87da12406')

package() {
  install -Dm644 "${srcdir}/LICENSE-$pkgver-$pkgrel" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/usr/bin/feather"
}
