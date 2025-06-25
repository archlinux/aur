# Maintainer:  jzapiola <jzapiola@proton.me>
# Contributor: GT610 <myddz1005@163.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname="zorin-icon-themes"
pkgdesc="The Zorin icon theme provided in a variety of color combinations"
pkgver=3.4.1
pkgrel=1
arch=('any')
url="https://github.com/ZorinOS/zorin-icon-themes"
license=('CC-BY-SA-4.0')
options=('!strip')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ZorinOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('218212d992b7ca9a2c95e302087fc79809e3f2cdbedb30247805dd11d6253c63')

package() {
    cd ${pkgname}-${pkgver}
    install -d "${pkgdir}"/usr/share/icons
    cp -r Zorin* "${pkgdir}"/usr/share/icons
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
