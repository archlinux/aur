# Maintainer: Dominik Danelski <dominik@danelski.pl>
pkgname=ttf-zaklad

pkgver=1.0
pkgrel=1
pkgdesc="Display font designed for use on signage and posters, it’s massive and sturdy construction was inspired the blocky geometrical letters from the Warsaw’s craftsmen shops."
arch=(any)
url="http://kroje.org/en/fonts/zaklad/"
license=('custom:OFL-1.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/warszawskie-kroje/zaklad/archive/v$pkgver.tar.gz" "LICENSE")
sha256sums=('8063fd23d96a485d40e032206b3e16e6e7f1e5cd70e4faa01a8221ceaa612113'
            'a22e755224fbe538e0d2883668938360a1b164a1e38b1b701d73e63e9cbe3a3a')
                                                                                                                                                                                                                                          
package() {                                                                                                                                                                                                                                  
        install -d "${pkgdir}/usr/share/fonts/OTF/"
        install -Dm644 "${srcdir}/zaklad-$pkgver/Zaklad-Regular/"*.otf  "${pkgdir}/usr/share/fonts/OTF/"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
