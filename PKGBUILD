# Maintainer: loathingkernel <loathingkernel a_ gmail d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=wine-mono-bin
pkgver=4.9.0
pkgrel=1
pkgdesc="Wine's built-in replacement for Microsoft's .NET Framework"
arch=('any')
url="https://wiki.winehq.org/Mono"
license=('GPL' 'LGPL2.1' 'MPL')
depends=('wine')
provides=('wine-mono=$pkgver')
conflicts=('wine-mono=$pkgver')
source=("https://github.com/madewokherd/wine-mono/releases/download/${pkgname/-bin/}-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('12bc6e3ca6d5ec7592ce7613b6c3ee1f6e415954f9866757d8c2fa7fa1b5b4488f1a58c368d482c47a4baad5c07431802a85e7d9df63029ef54d034669ccb01a')

package() {
  install -Dm 755 -d "$pkgdir"/usr/share/wine/mono/
  mv ${pkgname/-bin/}-$pkgver "$pkgdir"/usr/share/wine/mono/
}
