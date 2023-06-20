# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Asuka Minato

pkgname=killport-bin
pkgver=0.9.0
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
sha256sums_aarch64=('42a0793b27b6b22eeeb45bcdbe7842a812a50afa278f17419ba56e5b78d62215')
sha256sums_x86_64=('8066181166cf22afe107ff7b605089c1ae6c29857185f8a9794bda96844196ea')
sha256sums_i686=('179424664c4857b010b3d7785a0100a128091a146db765dace44a183470a7c33')
sha256sums_armv7h=('fbbf6a46c2aea685d68943b478db4ad5a9f64c8e2b126bf7359b730ff42b17bb')

package() {
  install -Dm755 killport -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/killport/"
}
