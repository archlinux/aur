pkgname=wine-stable-mono
_pkgname=wine-mono
pkgver=7.4.0
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework (for wine-stable)"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
conflicts=('wine-mono')
provides=("wine-mono=$pkgver")
source=("https://dl.winehq.org/wine/$_pkgname/$pkgver/$_pkgname-$pkgver-x86.tar.xz")
b2sums=('3a74106b9b3f21a88c2435f7988d66a54e08beea931a0ce0df6431c21add4ee2685bf9c9cb2404ee1a685736d61b1aee3cdd507130e5c5dddba7e506a2ff18bb')

package() {
  install -d -m755 "$pkgdir"/usr/share/wine/mono/
  cp -r -a --no-preserve='ownership' $_pkgname-$pkgver "$pkgdir"/usr/share/wine/mono/
}
