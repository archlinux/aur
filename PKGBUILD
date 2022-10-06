# Maintainer: jef

pkgname=nerd-fonts-space-mono
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Space Mono from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
source=("SpaceMono-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/SpaceMono.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
md5sums=('d85d9aabebf3612bdabbbfe1e919f13c'
         '935bbbdc8410b3b32315cc20da9d2126')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
