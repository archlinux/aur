# Maintainer: Roman Vishnevsky <aka [dot] x0x01 [at] gmail [dot] com>

pkgname=torrserver-bin
pkgver=1.1.76
pkgrel=1
pkgdesc="Torrent to http. Streams media torrent files as media streams without fully downloading"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/YouROK/TorrServer"
license=("GPL3")
provides=("torrserver=1.1.76")
conflicts=("torrserver")
depends=("glibc")
install=torrserver.install

source=( 'https://raw.githubusercontent.com/YouROK/TorrServer/master/torrserver.service' )
source_x86_64=("torrserver::https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-amd64")
source_i686=("torrserver::https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-386")
source_arm=("torrserver::https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm5")
source_armv6h=("torrserver::https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm6")
source_armv7h=("torrserver::https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm7")
source_aarch64=("torrserver::https://github.com/YouROK/TorrServer/releases/download/$pkgver/TorrServer-linux-arm64")
sha256sums=('a14635581190abae4bc7c555d609521e3cb46489cb72685aeb23daf6e4ed066b')
sha256sums_x86_64=('0f2e58a2d39b50ac6c55402a9ad29de3e7d900825d0a0c29d4d79ff41f89c4a1')
sha256sums_i686=('0f2e58a2d39b50ac6c55402a9ad29de3e7d900825d0a0c29d4d79ff41f89c4a1')
sha256sums_arm=('0f2e58a2d39b50ac6c55402a9ad29de3e7d900825d0a0c29d4d79ff41f89c4a1')
sha256sums_armv6h=('0f2e58a2d39b50ac6c55402a9ad29de3e7d900825d0a0c29d4d79ff41f89c4a1')
sha256sums_armv7h=('0f2e58a2d39b50ac6c55402a9ad29de3e7d900825d0a0c29d4d79ff41f89c4a1')
sha256sums_aarch64=('0f2e58a2d39b50ac6c55402a9ad29de3e7d900825d0a0c29d4d79ff41f89c4a1')

package() {
  install -Dm644 "$srcdir/torrserver.service" "$pkgdir/usr/lib/systemd/system/torrserver.service"
  install -Dm755 "$srcdir/torrserver" "$pkgdir/usr/bin/torrserver"
}
