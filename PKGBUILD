# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='A Luau runtime, similar to Lune, Node, or Bun.'
url='https://github.com/Scythe-Technology/zune'
license=('MIT')
depends=('glibc')
provides=('zune')
conflicts=('zune' 'zune-git')
arch=('x86_64' 'aarch64')
source=("https://raw.githubusercontent.com/Scythe-Technology/zune/v$pkgver/LICENSE.md")
source_x86_64=("$url/releases/download/v$pkgver/zune-$pkgver-linux-x86_64.zip")
source_aarch64=("$url/releases/download/v$pkgver/zune-$pkgver-linux-aarch64.zip")
sha256sums=('369563cb7a0e29e704f9b2f5a65f8934e4913028f2c0a1aacdde1dd106342d18')
sha256sums_x86_64=('5f5234034ea069402c4b7dba1a538e4c34c01debd4477077741065e988037eb4')
sha256sums_aarch64=('e53b270fbedc4b3bd07c29eb9f02357398ee51567b63bb825fb8e4bbec875d0c')

package() {
  install -Dm755 zune "$pkgdir/usr/bin/zune"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
