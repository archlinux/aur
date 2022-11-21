# Maintainer: xkww3n <xkww3n@outlook.com>
pkgname='tabby-terminal'
pkgver=1.0.187
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
sha256sums_aarch64=('7a229c28b04be337700e705c989fb7cddc656c7cd79fb4b31a228b1ee0c0f36f')
sha256sums_armv7h=('7a229c28b04be337700e705c989fb7cddc656c7cd79fb4b31a228b1ee0c0f36f')
sha256sums_x86_64=('c75c88756d25eafae1a2057f28def759133ff652bdd254c9dcef5b3bd8998510')
install=$pkgname.INSTALL
package() {
    cp -r usr/ "$pkgdir"
    cp -r opt/ "$pkgdir"
}