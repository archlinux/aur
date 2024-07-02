# Maintainer: Alexander Koch (lynix) <mail@alexanderkoch.net>

pkgname=sddm-theme-mnmlst
pkgver=1.0
pkgrel=1
pkgdesc="A very clean SDDM theme"
arch=('any')
url="https://github.com/lynix/sddm-theme-mnmlst"
license=('MIT')
depends=('sddm')
source=("https://github.com/lynix/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12e612f1b4479b663b7ff400d8183584fb99429122b68f11a0b72e996499ca14')

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "${pkgdir}/usr/share/sddm/themes/mnmlst"
    cp -r Components *.qml theme.conf metadata.desktop "$_/"
}
