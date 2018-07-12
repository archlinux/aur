# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chkit
pkgver=3.5.0
pkgrel=1
pkgdesc="The Containerum CLI"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://docs.containerum.com/cli"
license=('MIT')
source=("https://github.com/containerum/chkit/raw/v$pkgver/LICENSE")
source_i686=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_386_v$pkgver.tar.gz")
source_x86_64=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_amd64_v$pkgver.tar.gz")
source_arm=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_armv6h=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_armv7h=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_aarch64=("https://github.com/containerum/chkit/releases/download/v$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
md5sums=('bfa4ddd8612478bdf362161209972c9b')
md5sums_i686=('cfe20f0cfc78045b58151b329b3fbfeb')
md5sums_x86_64=('ad9787743ab22db3e25270ba3de62932')
md5sums_arm=('8072220554b6208ce79bafcb298f0b58')
md5sums_armv6h=('8072220554b6208ce79bafcb298f0b58')
md5sums_armv7h=('8072220554b6208ce79bafcb298f0b58')
md5sums_aarch64=('8072220554b6208ce79bafcb298f0b58')

package() {
  install -D -m755 chkit "$pkgdir/usr/bin/chkit"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
