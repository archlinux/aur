# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Asuka Minato

pkgname=killport-bin
pkgver=0.9.2
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
sha256sums_aarch64=('84e6a7705b2d7d3ff2e2cdae44edb7ea6b26b984faac02faf00f605560daebd8')
sha256sums_x86_64=('0c418ca56c76238035fb0684344196e2405bdd9373e6e45f5811af673aba8b2b')
sha256sums_i686=('7e139559bc088801169f1df662ad6496b5c53ab7c9cd495078db54f9431cb924')
sha256sums_armv7h=('5f7621ce587664f29ae0b1f53348f3737be31fd4160297747bcd7d872b07a851')

package() {
  install -Dm755 killport -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/killport/"
}
