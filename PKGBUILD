# Maintainer: swstl <swstl@hotmail.com>
pkgname=mal-tui
pkgver=1.1.9
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
sha256sums_x86_64=('5ee8a845b0d69e3b737838664048e3f8e9c4a5eb2b3afe049776d0a81473a413')
sha256sums_aarch64=('efb6a4e828d0437f0ca36465d9965f2a384f20ccb9515c81ac73b40a8f0f8add')
sha256sums_armv7h=('32fb5307b16325bacee6782835472457a382b038166621ee44fbed2c062a09a9')
sha256sums_i686=('a87c33e1385cb08de966ff6b37a1a0c87a919ecc1ed98a22e198fbb33f2d70af')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
