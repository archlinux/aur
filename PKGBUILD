# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Asuka Minato

pkgname=killport-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='Easily kill processes running on a specified port'
arch=(aarch64 x86_64 i686 armv7h)
url='https://github.com/jkfran/killport'
license=('MIT')
depends=(glibc gcc-libs)
provides=(killport)
conflicts=(killport)

source=(https://raw.githubusercontent.com/jkfran/killport/70e94827b03f957f799e47af40135ccfd1d97616/LICENSE)
source_aarch64=("$url/releases/download/v$pkgver/killport-aarch64-linux-gnu.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/killport-x86_64-linux-gnu.tar.gz")
source_i686=("$url/releases/download/v$pkgver/killport-i686-linux-gnu.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/killport-armv7-linux-gnueabihf.tar.gz")

sha256sums=('e023af3d4e0c544d684777de83d21f029df35a8bd60bf93dce2e703334095bf7')
sha256sums_aarch64=('0ccc0b04f4dff72b35067efe6f7d5c0cb0536217682486731e84d33f9edb8ee0')
sha256sums_x86_64=('3ee9b9c37ca9e3b305458140ea4feb45c1bbd2256ed5dd2cf7f8440a88627b03')
sha256sums_i686=('1a012f60f8c3cda2753c3e60ae0776584c6899c18d3e05ba0ff4e8bbd8d6b465')
sha256sums_armv7h=('e93c544139578862394dacf1a81eb8f34ad3ba99c6b1362ed9d45e64ab336aa0')

package() {
  install -Dm755 killport -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/killport/"
}
