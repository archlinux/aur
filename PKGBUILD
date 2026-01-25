# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune-bin
pkgver=0.5.3
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
sha256sums=('569b9fb6be4ae1b2fa4e28ea4fdd1b384f7f0958847b0cdf34f97cadf97ad269')
sha256sums_x86_64=('c1ea3495f94218040d0ae0a1ee164cc4857880ccb36b0b148ae2ce1462b5e87b')
sha256sums_aarch64=('be3f2c31d6057caa22d76e47a68e1f65ca5f9443650ab4bd32451001f8a22f85')

package() {
  install -Dm755 zune "$pkgdir/usr/bin/zune"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
