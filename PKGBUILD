pkgname=ttf-mono
pkgver=1.0.0
pkgrel=1
pkgdesc="Typeface for developers from JetBrains"
url="https://www.jetbrains.com/lp/mono/"
arch=('any')
license=('Apache')
depends=("fontconfig" "xorg-font-utils")
source=("https://download.jetbrains.com/fonts/JetBrainsMono-${pkgver}.zip")
md5sums=('1083f3f5315a564fb59d571da5c3b624')
 
package() {
    for i in *ttf
    do
        install -Dm644 $i "${pkgdir}/usr/share/fonts/TTF/$i"
    done
}
