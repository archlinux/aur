pkgname=wine-stable-mono
_pkgname=wine-mono
pkgver=7.0.0
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework (for wine-stable)"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
conflicts=('wine-mono')
provides=("wine-mono=$pkgver")
source=("https://dl.winehq.org/wine/$_pkgname/$pkgver/$_pkgname-$pkgver-x86.tar.xz")
b2sums=('504c57acce486c19a54bf33cdb4b9444c07a58a7f56ced0c93178886a91fa5d94a61f6e26aa885f3e3a2cceb2ff792f01006a4b16fa5bb88c3d25ddff02fefd7')

package() {
  install -d -m755 "$pkgdir"/usr/share/wine/mono/
  cp -r -a --no-preserve='ownership' $_pkgname-$pkgver "$pkgdir"/usr/share/wine/mono/
}
