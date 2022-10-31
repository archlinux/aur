# Maintainer: xkww3n <xkww3n@outlook.com>
pkgname='tabby-terminal'
pkgver=1.0.185
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('aarch64' 'armv7h' 'x86_64')
url='https://tabby.sh/'
license=('MIT')
depends=('alsa-lib' 'gtk3' 'nss' 'python')
optdepends=('gnome-keyring: Store SSH password'
            'libsecret: Store SSH password')
conflicts=('tabby' 'tabby-bin' 'tabby-terminal-git')
source_aarch64=("https://github.com/Eugeny/tabby/releases/download/v$pkgver/tabby-$pkgver-linux-armhf.pacman")
source_armv7h=("https://github.com/Eugeny/tabby/releases/download/v$pkgver/tabby-$pkgver-linux-armhf.pacman")
source_x86_64=("https://github.com/Eugeny/tabby/releases/download/v$pkgver/tabby-$pkgver-linux-x64.pacman")
sha256sums_aarch64=('5514439a3f30fbdea5f8bb528599c746ab9eb1e0ee7ae376f5915becc87561f3')
sha256sums_armv7h=('5514439a3f30fbdea5f8bb528599c746ab9eb1e0ee7ae376f5915becc87561f3')
sha256sums_x86_64=('d07b8d614a62ef8373e22714df64735ca1fa693bc5f291f3c91f23f700f42645')
install=$pkgname.INSTALL
package() {
    cp -r usr/ "$pkgdir"
    cp -r opt/ "$pkgdir"
}