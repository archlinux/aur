# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=geist-font
pkgname=(otf-geist
         ttf-geist
         ttf-geist-variable
         otf-geist-mono
         ttf-geist-mono
         ttf-geist-mono-variable)
pkgver=1.5.1
pkgrel=1
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/${pkgver}/geist-font-${pkgver}.zip")
sha256sums=('2e5495158a952ac839dfbb371d4910d2f6f0ea8e0253f103bc6cf66041886e4c')

package_otf-geist() {
    cd "geist-font-${pkgver}"
    install -Dm644 fonts/Geist/otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist() {
    cd "geist-font-${pkgver}"
    install -Dm644 fonts/Geist/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-variable() {
    cd "geist-font-${pkgver}"
    install -Dm644 fonts/Geist/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_otf-geist-mono() {
    cd "geist-font-${pkgver}"
    install -Dm644 fonts/GeistMono/otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono() {
    cd "geist-font-${pkgver}"
    install -Dm644 fonts/GeistMono/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono-variable() {
    cd "geist-font-${pkgver}"
    install -Dm644 fonts/GeistMono/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
