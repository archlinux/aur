# Maintainer: whoami <whoami@systemli.org>

pkgname=vlang
pkgver=0.0.10
pkgrel=1
pkgdesc='Simple, fast, safe language created for developing maintainable software'
arch=('x86_64')
url='https://vlang.io'
license=('MIT')
license=('custom')
depends=('glfw' 'libfreetype.so' 'libcurl.so')
conflicts=('v')
source=("http://vlang.io/early_v_patreon.zip")

#build() {
#    cd "$pkgver/linux"
#    сс -w -o vc v.c
#    ./vc -o v .
#}

package() {
    cd "$pkgver/linux"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 v "$pkgdir/usr/bin/v"
    install -d "$pkgdir/usr/lib/v"
    cp -a vlib "$pkgdir/usr/lib/v"
}

sha256sums=('15fe4835674fc66694d13e8e9700a65803b34696d255c207690ba33c2ac24f77')
