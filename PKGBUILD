# Maintainer: Dominik Danelski <dominik@danelski.pl>
pkgname=ttf-havana
pkgver=1.0
pkgrel=1
pkgdesc="Font inspired by Warsaw neon signs from before 1989. It’s design is detail oriented, coherent and sophisticated."
arch=(any)
url="http://kroje.org/en/fonts/havana/"
license=('custom:OFL-1.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/warszawskie-kroje/havana/archive/v$pkgver.tar.gz" "LICENSE")
sha256sums=('0d61a322f1e8f061a85e12a77fb6f3dbf5161670634c0d179c7ae29c3af7c7c5'
            'a22e755224fbe538e0d2883668938360a1b164a1e38b1b701d73e63e9cbe3a3a')
                                                                                                                                                                                                                                          
package() {                                                                                                                                                                                                                                  
        install -d "${pkgdir}/usr/share/fonts/OTF/"
        install -Dm644 "${srcdir}/havana-$pkgver/Havana-Regular/"*.otf  "${pkgdir}/usr/share/fonts/OTF/"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
