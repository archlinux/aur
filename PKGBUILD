# Maintainer: xkww3n <xkww3n@outlook.com>
pkgname='tabby-terminal'
pkgver=1.0.189
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
sha256sums_aarch64=('cff04581d0f9e2cecc872e45d4952f12ae26aff103165d2404d343002fb06228')
sha256sums_armv7h=('cff04581d0f9e2cecc872e45d4952f12ae26aff103165d2404d343002fb06228')
sha256sums_x86_64=('c273261e06879926fc74bf0fc6836c30025bf3d2dd356a0f8b08546c893ecbc3')
install=$pkgname.INSTALL
package() {
    cp -r usr/ "$pkgdir"
    cp -r opt/ "$pkgdir"
}
