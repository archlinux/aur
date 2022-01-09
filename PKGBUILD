# Maintainer alfredjophy <at> protonmail <dot> com
pkgname=swayblur
pkgdesc="Blurs the wallpaper when a client is present"
pkgver=1.1.0
pkgrel=1
url="https://github.com/willpower3309/swayblur"
arch=('any')
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a13a68e5c508357c30e9af88fa2fc493490584fe413859e95cfa0aa5bbc5a140')
provides=('swayblur')
depends=('imagemagick' 'python-i3ipc' 'oguri')
package(){
    cd "$pkgname-$pkgver"
    PIP_CONFIG_FILE=/dev/null 
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
