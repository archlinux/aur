# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Asuka Minato

pkgname=killport-bin
pkgver=1.1.0
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
sha256sums_aarch64=('70761c558e2b4ac628033f4fa67bc4367d41eb67065e28973b75da1b8c86a6e3')
sha256sums_x86_64=('b86af2a459279766b29f801aad50e644ba8aaf4eb1c53ee7183bef73b6fdee38')
sha256sums_i686=('f1c6cfef0e3805847708ad74d82eea44a7feb1455d95590fc269767a14bcbf86')
sha256sums_armv7h=('fc9a98751e13e25270aff3492f3cd427235526c4c4fa082417ba20e372859237')

package() {
  install -Dm755 killport -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/killport/"
}
