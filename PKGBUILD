# Maintainer: Juan Carlos <juancarlospaco@gmail.com>


pkgname=ttf-fuzzy-cootie
pkgver=1.0.1
pkgrel=1
pkgdesc="fuzzy-cootie font"
arch=("any")
url="https://github.com/juancarlospaco/fuzzy-cootie#fuzzy-cootie"
license=('GPL')
depends=('fontconfig' 'unzip' 'xorg-font-utils')
source=("https://github.com/juancarlospaco/fuzzy-cootie/archive/master.zip")
sha256sums=('e17fad9b57bc43298a9ea28f0f1ce1884f4b85247358c570ea396a3d5abd2d82')


package() {
    cd "$srcdir"
    echo -e "\x1b[29;5;7m Extracting files from ZIP... \x1b[0m"
    unzip -vo "master.zip"
    echo -e "\x1b[29;5;7m Installing... \x1b[0m"
    install -Dm644 "$srcdir/fuzzy-cootie-master/FuzzyCootie.ttf" "$pkgdir/usr/share/fonts/TTF/FuzzyCootie.ttf"
}
