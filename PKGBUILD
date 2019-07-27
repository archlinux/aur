# Maintainer: Daniel Escoz <darkhogg+aur.obsidian@gmail.com>
pkgname=lightdm-webkit2-theme-obsidian
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple dark theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/Darkhogg/${pkgname}"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/Darkhogg/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d69cbf1d1a74f17b38e1ebf7b832ad9fd52106a6c3314c5a45d0de706ef988adf7d38fb301f07c7a8d769d5e2e541518f7e97477da3ffe53ba0a531e02b201c7')

package() {
    install -dm 755 "${pkgdir}/usr/share/lightdm-webkit/themes/obsidian"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/usr/share/lightdm-webkit/themes/obsidian/"
}

