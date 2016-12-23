# Maintainer: Timothy Redaelli <tredaelli@archlinux.org>

pkgname=melis-wallet-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="The most advanced bitcoin wallet."
arch=('x86_64')
url="https://www.melis.io/"
license=('custom')
options=(!strip)
depends=('alsa-lib' 'libxss' 'libxtst' 'gconf' 'gtk2' 'nss')
source=(https://www.melis.io/packages/production/linux/melis-wallet-linux-x64-$pkgver.tar.gz)
md5sums=('7c6897917341f26cd68df1c9dbfabcf3')

package() {
  install -dm755 "$pkgdir"/usr/lib/melis-wallet/
  install -dm755 "$pkgdir"/usr/bin/
  cp -a melis-wallet-linux-x64/* "$pkgdir"/usr/lib/melis-wallet/
  ln -s ../lib/melis-wallet/melis-wallet "$pkgdir"/usr/bin
}

# vim:set ts=2 sw=2 et:
