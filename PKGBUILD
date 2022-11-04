# Maintainer: xkww3n <xkww3n@outlook.com>
pkgname='tabby-terminal'
pkgver=1.0.186
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
sha256sums_aarch64=('457f19ac8999f7779ab65c90edf9ca030a12c1f68297a7586e134be39215b601')
sha256sums_armv7h=('457f19ac8999f7779ab65c90edf9ca030a12c1f68297a7586e134be39215b601')
sha256sums_x86_64=('c9258187cb64dc2403e29e34c803c90122ef780d567b8eab28b23927920ba33e')
install=$pkgname.INSTALL
package() {
    cp -r usr/ "$pkgdir"
    cp -r opt/ "$pkgdir"
}