# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=geist-font
pkgname=(otf-geist
         ttf-geist
         ttf-geist-variable
         otf-geist-mono
         ttf-geist-mono
         ttf-geist-mono-variable)
pkgver=1.6.0
pkgrel=1
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/${pkgver}/geist-font-${pkgver}.zip")
sha256sums=('784a8ea7d16e1dd71ceaad52f6f92d557ae58fd76c292b9f6d370085df936f53')

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
