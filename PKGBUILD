# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=geany-theme-fluffy
pkgdesc='Port of the Fluffy theme from gedit-themes'
url='http://lara.craft.net.br'
pkgver=1
pkgrel=3
arch=(any)
license=('custom')
depends=('geany')
source=("http://lara.craft.net.br/Geany/fluffy.conf"
        "Copyright.txt")
md5sums=('3752d67c34860874a20f0110cb0fcec6'
         'e9553ad48d92f168471595c40be8da8a')

package() {
    install -Dm644 "$srcdir"/fluffy.conf "$pkgdir"/usr/share/geany/colorschemes/fluffy.conf
    install -Dm644 Copyright.txt "$pkgdir"/usr/share/licenses/$pkgname/Copyright
}
