# Maintainer: jef

pkgname=nerd-fonts-space-mono
pkgver=2.1.0
pkgrel=1
pkgdesc="Patched font Space Mono from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
source=("SpaceMono-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/SpaceMono.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
md5sums=('7f16c5d4f1609c06210c11196c8770fd'
         '1b95f7668f3a4440b0d404e8dc3ccd9c')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
