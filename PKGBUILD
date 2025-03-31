# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.8.0
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet' 'feather-wallet')
conflicts=('featherwallet' 'featherwallet-appimage' 'feather-wallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "LICENSE-$pkgver-$pkgrel::https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('dc48c587a1fe4b4014059e3365c567764c04552e9c67ef0bc882be9165b41d7e4cc1527c6ba169d766469ea83cedc319efc7e8ef3ba86b0524785f323ff56554'
            'dc6652639f2b223a44d7c67807a36749ee0d1807d70c7d3e9b27a53566fe5a32f44b121c0deb2df466491b223f5a7aa87880d3544681d5ee308752f87da12406')

package() {
  install -Dm644 "${srcdir}/LICENSE-$pkgver-$pkgrel" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/usr/bin/feather"
}
