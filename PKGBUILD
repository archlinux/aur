# Maintainer: ammarsyamil057@gmail.com

pkgname=hyprlarp
pkgver=0.1.0
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
# No makedepends needed – we are not compiling

source=("https://github.com/AmmarSyamil/HyprLarp/releases/download/hyprland/hyprlarp")
sha512sums=('82f2092678016dfcb666f434fcff4ab10bfde30d18df51d1c6f0d519874d01063fcb48a9ec6e832c7fab010901cc7eee7329e6905be23e20bc58d6226e77956d')

package() {
    cd "${srcdir}"
    # tar -xf "hyprlarp.tar.gz"
    # Assuming the tarball contains a single executable named "HyprLarp"
    install -Dm755 hyprlarp "${pkgdir}/usr/bin/HyprLarp"
}