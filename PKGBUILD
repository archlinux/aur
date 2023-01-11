# Maintainer: 
# Contributor: Yamada Hayao <development@fascode.net>

pkgname="zorin-icon-themes"
pkgdesc="The Zorin icon theme provided in a variety of color combinations"
pkgver=2.9.11
pkgrel=1
arch=('any')
url="https://zorinos.com/"
license=('GPL')
options=('!strip')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ZorinOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('52727e07fa5e30a3d095273cdd001d3fc7201fc4177a6a6f5659352ccc584cc2')

package() {
    cd ${pkgname}-${pkgver}
    install -d "${pkgdir}"/usr/share/icons
    cp -r Zorin* "${pkgdir}"/usr/share/icons
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
