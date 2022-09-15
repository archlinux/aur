# Maintainer: 0xMRTT < 0xMRTT at proton dot me >

pkgname="gradience-plugins"
pkgver=0.2.3
pkgrel=2
pkgdesc='Gradience Plugins'
arch=('any')
url="https://github.com/GradienceTeam/Plugins"
license=('GPLv3')
source=("git+$url")
makedepends=('git')
sha256sums=('SKIP')
depends=('gradience' 'python' 'python-pluggy')
package() {
    cd "$srcdir/Plugins"

    find . \
        -type f \
     \( -name "*.py" -o -name "*.yapsy-plugin" \) \
        -exec install -Dm 0755 -t "$pkgdir/usr/share/gradience/plugins/." {} +
}
