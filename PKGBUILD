# Maintainer: Jah Way <jahway603 at tutanota dot de>

pkgname=featherwallet-bin
_pkgname=featherwallet
pkgver=2.8.1
pkgrel=1
pkgdesc='A free, open-source Monero light wallet.'
url='https://featherwallet.org'
arch=('x86_64')
license=('custom')
provides=('featherwallet' 'feather-wallet')
conflicts=('featherwallet' 'featherwallet-appimage' 'feather-wallet' 'monero-feather' 'monero-feather-git' 'monero-feather-bin' 'monero-feather-appimage')
source=("$url/files/releases/linux/feather-$pkgver-linux.zip"
        "LICENSE-$pkgver-$pkgrel::https://raw.githubusercontent.com/feather-wallet/feather/master/LICENSE")
sha512sums=('88e012d95130b39c87d37385b58dcb3821f4480f66fe37f9c1826986689a8302f9aff8cd447eba18436471370338bfa376f23a2f04b1e1ce1e1b8e0a3c6f5d16'
            'dc6652639f2b223a44d7c67807a36749ee0d1807d70c7d3e9b27a53566fe5a32f44b121c0deb2df466491b223f5a7aa87880d3544681d5ee308752f87da12406')

package() {
  install -Dm644 "${srcdir}/LICENSE-$pkgver-$pkgrel" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "${srcdir}/feather-$pkgver" "$pkgdir/usr/bin/feather"
}
