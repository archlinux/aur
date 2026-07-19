# Maintainer: ammarsyamil057@gmail.com

pkgname=hyprlarp
pkgver=0.1.1
pkgrel=1
pkgdesc="Hyprland terminal video viewer with adaptive dynamic layout."
arch=('x86_64')
url="https://github.com/ammarsyamil/HyprLarp"
license=('GPL3')
depends=(
    'qt5-base'
    'ffmpeg'
    'opencv'
    'simdjson'
    'nlohmann-json'
    'hyprland'
    'kitty'
    'gcc-libs'
    'glibc'
)

source=("https://github.com/AmmarSyamil/HyprLarp/releases/download/hyprland/hyprlarp")
sha512sums=('SKIP')

package() {
    cd "${srcdir}"
    install -Dm755 hyprlarp "${pkgdir}/usr/bin/HyprLarp"
}