pkgname=wine-stable-mono
_pkgname=wine-mono
pkgver=9.4.0
pkgrel=1
pkgdesc='Wine’s built-in replacement for Microsoft’s .NET Framework (for wine-stable)'
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
conflicts=('wine-mono')
provides=("wine-mono=$pkgver")
source=("https://dl.winehq.org/wine/$_pkgname/$pkgver/$_pkgname-$pkgver-x86.tar.xz")
b2sums=('a4d88b274e06a8f8f02e2f74e55fd0df5e4836f45295af711f2f3d3f2bf18432bc7c41c9c2392a0e6b584b67358740acd7f3572cafd32afd08060e8c9e060c0a')

package() {
  install -d -m755 "$pkgdir"/usr/share/wine/mono/
  cp -a --no-preserve='ownership' $_pkgname-$pkgver "$pkgdir"/usr/share/wine/mono/
}
