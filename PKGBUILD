# Maintainer: mater11234 <mater11234@riseup.net>
pkgname=nerd-fonts-profont-windows
pkgver=2.1.0
pkgrel=1
pkgdesc="Patched font ProFontWindows from nerd-fonts library"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
makedepends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
source=("https://github.com/mater11234/pro-font-win/releases/download/2.1.0/ProFontWindows-2.1.0.tar.gz"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/LICENSE")
md5sums=('9fcb9168aaf64e7c68e9a2fdfdff4a18'
         '1b95f7668f3a4440b0d404e8dc3ccd9c')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
