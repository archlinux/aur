# Maintainer: Kevin Del Castillo R. <lans9831@gmail.com>

pkgname=adapta-gtk-theme-colorpack
pkgver=3.94.0.149
pkgrel=1
pkgdesc="Adapta GTK Theme Colorpack"
arch=('any')
url=https://github.com/ivankra/adapta-gtk-theme-colorpack
license=('GPL')
depends=()
optdepends=('ttf-roboto: recommended font'
            'noto-fonts: recommended font'
            'gtk-engine-murrine: for gtk2 themes')
source=("https://github.com/ivankra/$pkgname/releases/download/$pkgver-colorpack/${pkgname}_${pkgver}.tar")
md5sums=(6f17b20e1e5c6e6557eb6f56afd3be59)

package() {
    mkdir -p "$pkgdir/usr/share/themes"
    rm *.tar 
    cp -r * "$pkgdir/usr/share/themes"
}

