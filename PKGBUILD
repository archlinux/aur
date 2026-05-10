# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.6
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/swstl/mal-tui"
license=('MIT')
depends=('glibc' 'ani-cli')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-aarch64")
source_armv7h=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-armv7")
source_i686=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-i686")
sha256sums_x86_64=('bd8274591607108c8a70436cf3b4c5606caad2a6a9d05d16f7e240006d621a9f')
sha256sums_aarch64=('d752b0c97d7eb75c28eb27fef9f0a606e5b83995f5046d6ca0cfd7f3c3dd16f7')
sha256sums_armv7h=('c9acb483368cede669500f1862ad611a83f6ecc026c5395f1ba16188b943df7e')
sha256sums_i686=('2a6286976caa851d54592f9388c041bb33f546be946211ebdb6e3e998d0ef2a3')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
