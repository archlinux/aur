pkgname=wine-stable-mono
_pkgname=wine-mono
pkgver=5.1.1
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework (for wine-stable)"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine-stable')
source=("https://dl.winehq.org/wine/$_pkgname/$pkgver/$_pkgname-$pkgver-x86.tar.xz")
b2sums=('162e5c8b12a0384d218ae049c8a948d48fe50ca51212e1c00f11a207f26a759c749d1b8cd416990856358af3d9899670a363d568eda83b66f5e94efc72eea1ff')

package() {
  install -d -m755 "$pkgdir"/usr/share/wine/mono/
  cp -r -a --no-preserve='ownership' $_pkgname-$pkgver "$pkgdir"/usr/share/wine/mono/
}
