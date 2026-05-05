# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune-bin
pkgver=0.5.6
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
sha256sums_x86_64=('123521861ba15a949c138626cb578bfc24f5faa864d7c8d00b1f6d9be45f3d91')
sha256sums_aarch64=('1303445fade4109eb41521d8f404bd907e846c878608a51ff0ccedb6fb0f7803')

package() {
  install -Dm755 zune "$pkgdir/usr/bin/zune"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
