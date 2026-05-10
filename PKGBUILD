# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.5
pkgrel=1
pkgdesc="A terminal client for MyAnimeList (integrated with ani-cli) written in rust"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/swstl/mal-tui"
license=('MIT')
depends=('glibc' 'mpv' 'ani-cli')
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-x86_64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-aarch64")
source_armv7h=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-armv7")
source_i686=("$pkgname-$pkgver::$url/releases/download/v$pkgver/mal-tui-linux-i686")
sha256sums_x86_64=('9373761f9c2a42774319bc7c0c3ec44871c4c8500adee238e3b61da8f517ad79')
sha256sums_aarch64=('66fd4ba7dca0b28b343f897462a2b9bbd6e867296fd07ffcf10ef7b6f1631398')
sha256sums_armv7h=('318b2e71c92af4f34a18f8feb470b882b755f36cd507b7de7695d9ce673ba7f6')
sha256sums_i686=('648adc3258234d52a1afcb6e423a4142b7cecc6d9cbf949ba04cd83bd10225d4')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
