# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chkit
pkgver=3.1.2
pkgrel=1
pkgdesc="The Containerum CLI"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://containerum.com/documentation"
license=('MIT')
source=("https://github.com/containerum/chkit/raw/v$pkgver/LICENSE")
source_i686=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_386_v$pkgver.release.tar.gz")
source_x86_64=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_amd64_v$pkgver.release.tar.gz")
source_arm=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.release.tar.gz")
source_armv6h=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.release.tar.gz")
source_armv7h=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.release.tar.gz")
source_aarch64=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.release.tar.gz")
md5sums=('bfa4ddd8612478bdf362161209972c9b')
md5sums_i686=('8f229f4ca7c4428da7248a36e3a3f4db')
md5sums_x86_64=('90601159de98d87eb7f465b2a2d0fd4b')
md5sums_arm=('69e4c0b0d655b89d60b969110277ec10')
md5sums_armv6h=('69e4c0b0d655b89d60b969110277ec10')
md5sums_armv7h=('69e4c0b0d655b89d60b969110277ec10')
md5sums_aarch64=('69e4c0b0d655b89d60b969110277ec10')

package() {
  install -D -m755 chkit "$pkgdir/usr/bin/chkit"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
