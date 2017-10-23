# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=chkit
pkgver=2.1.5
pkgrel=2
pkgdesc="The Containerum CLI"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://containerum.com/documentation"
license=('MIT')
source=("https://github.com/containerum/chkit/raw/$pkgver/LICENSE")
source_i686=("https://github.com/containerum/chkit/releases/download/$pkgver/chkit_linux_x86_v$pkgver.tar.gz")
source_x86_64=("https://github.com/containerum/chkit/releases/download/$pkgver/chkit_linux_x64_v$pkgver.tar.gz")
source_arm=("https://github.com/containerum/chkit/releases/download/$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_armv6h=("https://github.com/containerum/chkit/releases/download/$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_armv7h=("https://github.com/containerum/chkit/releases/download/$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
source_aarch64=("https://github.com/containerum/chkit/releases/download/$pkgver/chkit_linux_arm_v$pkgver.tar.gz")
md5sums=('bfa4ddd8612478bdf362161209972c9b')
md5sums_i686=('43c014f6ea407491831418c482fe58d7')
md5sums_x86_64=('6c91816a28252f8ac2d7854906eb27af')
md5sums_arm=('78aa5c144494568f0afb421598d4b823')
md5sums_armv6h=('78aa5c144494568f0afb421598d4b823')
md5sums_armv7h=('78aa5c144494568f0afb421598d4b823')
md5sums_aarch64=('78aa5c144494568f0afb421598d4b823')

build() {
  ./chkit genautocomplete > completions
}

package() {
  install -D -m755 chkit "$pkgdir/usr/bin/chkit"
  install -D -m644 completions "$pkgdir/usr/share/bash-completion/completions/chkit"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
