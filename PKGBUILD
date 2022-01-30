# Maintainer: Никола Милинковић <nikola.milinkovic@disroot.org>

pkgname='otf-tesla'
pkgdesc="Script font based on a reconstruction of Nikola Tesla's handwriting"
pkgver=1
pkgrel=1
arch=('any')
url='https://www.tipometar.org/kolumne/TeslaFont/IndexEng.html'
groups=('tipometar-fonts')
license=('custom')

source=(
    'https://www.tipometar.org/kolumne/TeslaFont/img/Tesla%20OTF.zip'    
    'LICENSE'
    'LICENSE_sr'
)    

sha256sums=('6d8c65a7a7525ea2373729f2d0b81b9299d5e778cb21cebc8a636c30b9e2542e'
            'ceb67165941aa54cd6ed305006d0760fba9f14529160f864fb4382e44d77da2a'
            'a91869da9f82175676f8f49b6a463a58e9e566c85f4c3e224796086699d6a5e0')            
            
package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" 'Tesla.otf'
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE' 'LICENSE_sr'
}
