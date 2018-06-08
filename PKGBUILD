# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chkit
pkgver=3.2.0
pkgrel=1
pkgdesc="The Containerum CLI"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://containerum.com/documentation"
license=('MIT')
source=("https://github.com/containerum/chkit/raw/v$pkgver/LICENSE")
source_i686=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_386_v$pkgver.tar.gz")
source_x86_64=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_amd64_v$pkgver.tar.gz")
source_arm=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_armv6h=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_armv7h=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_aarch64=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
md5sums=('bfa4ddd8612478bdf362161209972c9b')
md5sums_i686=('d4b0b44cdb7ee29cfdf3ff716cf9532b')
md5sums_x86_64=('6b21c6e9bef03e9aeb6f56c66da38fc3')
md5sums_arm=('098dc190b2758b98e98eeaf2ecfaa997')
md5sums_armv6h=('098dc190b2758b98e98eeaf2ecfaa997')
md5sums_armv7h=('098dc190b2758b98e98eeaf2ecfaa997')
md5sums_aarch64=('098dc190b2758b98e98eeaf2ecfaa997')

package() {
  install -D -m755 chkit "$pkgdir/usr/bin/chkit"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
