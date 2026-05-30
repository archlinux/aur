# Maintainer: Simon Désaulniers <sim.desaulniers@gmail.com>
pkgname=hypr-layout-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI tool to launch and arrange tiled window layouts in Hyprland using a simple DSL'
arch=('x86_64')
url='https://github.com/sim590/hypr-layout'
license=('GPL-3.0-or-later')
provides=('hypr-layout')
conflicts=('hypr-layout')
source=("hypr-layout-${pkgver}::${url}/releases/download/${pkgver}/hypr-layout-${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('7fae5944fa4296d6abfea72a87274532c001a77cd400242d12769a1267fab03f')

package() {
    install -Dm755 "hypr-layout-${pkgver}" "${pkgdir}/usr/bin/hypr-layout"
}
