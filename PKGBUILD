# Maintainer: xkww3n <xkww3n@outlook.com>
pkgname='tabby-terminal'
pkgver=1.0.188
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
sha256sums_aarch64=('19341a23ecd8a34d76d4bb212f85bb5ccbd51999453c7ee08471506a95105e0b')
sha256sums_armv7h=('19341a23ecd8a34d76d4bb212f85bb5ccbd51999453c7ee08471506a95105e0b')
sha256sums_x86_64=('08b5deb4ede070b40521c0b656ca28d92babaaa6630f1ee7aa566de1f93eb635')
install=$pkgname.INSTALL
package() {
    cp -r usr/ "$pkgdir"
    cp -r opt/ "$pkgdir"
}
