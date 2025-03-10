# Maintainer:  jzapiola <jzapiola@proton.me>
# Contributor: GT610 <myddz1005@163.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname="zorin-icon-themes"
pkgdesc="The Zorin icon theme provided in a variety of color combinations"
pkgver=3.3.2
pkgrel=1
arch=('any')
url="https://github.com/ZorinOS/zorin-icon-themes"
license=('CC-BY-SA-4.0')
options=('!strip')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ZorinOS/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('669da18c1aa782cdbd4b7c31fd6fd22d0441a4673354ef2bbf6c3d0bf721466f')

package() {
    cd ${pkgname}-${pkgver}
    install -d "${pkgdir}"/usr/share/icons
    cp -r Zorin* "${pkgdir}"/usr/share/icons
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
