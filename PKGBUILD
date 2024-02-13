pkgname=wine-stable-mono
_pkgname=wine-mono
pkgver=8.1.0
pkgrel=1
pkgdesc='Wine’s built-in replacement for Microsoft’s .NET Framework (for wine-stable)'
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
conflicts=('wine-mono')
provides=("wine-mono=$pkgver")
source=("https://github.com/madewokherd/wine-mono/releases/download/wine-mono-$pkgver/wine-mono-$pkgver-x86.tar.xz")
b2sums=('0e0dd83b92016da328547173d25dc396a895a7a161cd54796c9bda34ae958856f1bee342c1bb5fcffcf695b35adf66b2bf83cfa61e01790bf4b0f2d198f84feb')

package() {
  install -d -m755 "$pkgdir"/usr/share/wine/mono/
  cp -a --no-preserve='ownership' $_pkgname-$pkgver "$pkgdir"/usr/share/wine/mono/
}
