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
sha256sums_x86_64=('ab214f6abccc5952d4253605b49c4f645f6eb658c474defb5f4db822502f4aa0')
sha256sums_aarch64=('88dd922bd95be151ebc4dfd28b00b1ad602eafdcd192347ed457de5c3b8a93a1')
sha256sums_armv7h=('42148cf807de5a2fd379aec71b033630fba4caae5b63899394b7573f4733b80c')
sha256sums_i686=('1964bf9b8e7ef0742ae4f88ff504a34a9aa8680e646f62f0642013e04246dad1')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
