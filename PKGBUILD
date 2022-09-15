# Maintainer: 0xMRTT < 0xMRTT at proton dot me >

pkgname="gradience-backgrounds"
pkgver=0.2.3
pkgrel=2
pkgdesc='Gradience Backgrounds'
arch=('any')
url="https://github.com/GradienceTeam/Design"
license=('GPLv3')
source=("git+$url")
makedepends=('git')
sha256sums=('SKIP')

package() {
    cd "$srcdir/Design/Backgrounds"

    find . \
        -type f \
     \( -name "*.png" -o -name "*.svg" \) \
        -exec install -Dm 0755 -t "$pkgdir/usr/share/backgrounds/gradience/." {} +
}
