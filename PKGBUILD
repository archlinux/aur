# Contributor: Artem Stasyuk <stasyukartem2@gmail.com>
# Maintainer: Artem Stasyuk <stasyukartem2@gmail.com>

pkgname=ttf-aptos
pkgver=1.0
pkgrel=1
pkgdesc="Default Microsoft Office font, developed by Microsoft"
arch=('any')
url="https://learn.microsoft.com/en-us/typography/font-list/aptos"
license=('custom')
source=("https://github.com/XCroatoanX/${pkgname}/releases/download/1.09/${pkgname}.zip")
sha256sums=('c4953494f96e9e4bbe6dc9c92d8b791be230bdadd410160e9bf1d3e4edf178f9')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
}
