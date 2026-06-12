# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zune-bin
pkgver=0.5.7
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
sha256sums=('565a37ce713028576fa564b10174afb9560a94af69164767307c29ef2711ecbb')
sha256sums_x86_64=('075328273fe5eaabc71126ccfbd9cf4bab12a00c2b56004cb5f371d6adb5cde1')
sha256sums_aarch64=('6302e19ebee6dddeca8c8a0013a0db7ee0f2f5b6c09a18d79b9ee088a3694d11')

package() {
  install -Dm755 zune "$pkgdir/usr/bin/zune"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
