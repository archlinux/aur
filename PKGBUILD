# Maintainer: Alexander Koch (lynix) <mail@alexanderkoch.net>

pkgname=sddm-theme-mnmlst
pkgver=1.1
pkgrel=1
pkgdesc="A very clean SDDM theme"
arch=('any')
url="https://github.com/lynix/sddm-theme-mnmlst"
license=('MIT')
depends=('sddm')
source=("https://github.com/lynix/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2e30891b4d84e8b57c29e2fdad17f2aee971d04f3f5430190e1b2494f52a3af')

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "${pkgdir}/usr/share/sddm/themes/mnmlst"
    cp -r Components *.qml theme.conf metadata.desktop "$_/"
}
