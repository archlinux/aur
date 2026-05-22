# Maintainer: Simon Désaulniers <sim.desaulniers@gmail.com>
pkgname=hypr-layout-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI tool to launch and arrange tiled window layouts in Hyprland using a simple DSL'
arch=('x86_64')
url='https://github.com/sim590/hypr-layout'
license=('GPL-3.0-or-later')
provides=('hypr-layout')
conflicts=('hypr-layout')
source=("hypr-layout-${pkgver}::${url}/releases/download/${pkgver}/hypr-layout-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('bc60d797f30ab61c17848a91a97f0f598ad5e3d4644a576e15aedacd6f9e1701')

package() {
    install -Dm755 "hypr-layout-${pkgver}" "${pkgdir}/usr/bin/hypr-layout"
}
