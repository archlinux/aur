# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=zune-bin
pkgver=0.5.1
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
sha256sums_x86_64=('919eac123fa8657d037c62bca95d090d573fc3a06a1c49b85b4eb187d5bdb148')
sha256sums_aarch64=('e7b8eedd5884380db0fe850dd9236c5ae3dedb0d13f10ca7b79d34c6a5ec1a12')

package() {
    install -Dm755 zune "$pkgdir/usr/bin/zune"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
