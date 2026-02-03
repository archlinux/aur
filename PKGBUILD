# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune-bin
pkgver=0.5.4
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
sha256sums_x86_64=('8feec2f05be28e403a8bf6db734704f699af5a21100ecd8f059ac0e20308914a')
sha256sums_aarch64=('9ab264dee4907819d5460b2fc78fa684766f134ba58fa659233b4b012ea29f9e')

package() {
  install -Dm755 zune "$pkgdir/usr/bin/zune"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
