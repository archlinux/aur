# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=whiskers-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="A templating tool to simplify the creation of Catppuccin ports."
url="https://github.com/catppuccin/toolbox"
conflicts=('catwalk' 'catwalk-git')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/whiskers-v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('3dfa4fa350cb435e5216250aacebb78dcdf05cfd702c255a9af15f919dd2cbff')

package() {
    install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
