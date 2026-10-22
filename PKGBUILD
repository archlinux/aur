# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgbase=geist-font
pkgname=(otf-geist
         ttf-geist
         ttf-geist-variable
         otf-geist-mono
         ttf-geist-mono
         ttf-geist-mono-variable
         otf-geist-pixel
         ttf-geist-pixel
         ttf-geist-pixel-variable)
pkgver=1.8.2
pkgrel=1
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/v${pkgver}/${pkgbase}-v${pkgver}.zip")
sha256sums=('43ffb66912b1c49e40c371d96e86b3b3dab42db83eb2d0c8a17321210394c4c7')

package_otf-geist() {
    cd "${pkgbase}"
    install -Dm644 Geist/otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist() {
    cd "${pkgbase}"
    install -Dm644 Geist/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-variable() {
    cd "${pkgbase}"
    install -Dm644 Geist/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_otf-geist-mono() {
    cd "${pkgbase}"
    install -Dm644 GeistMono/otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono() {
    cd "${pkgbase}"
    install -Dm644 GeistMono/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-mono-variable() {
    cd "${pkgbase}"
    install -Dm644 GeistMono/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_otf-geist-pixel() {
    cd "${pkgbase}"
    install -Dm644 GeistPixel/otf/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-pixel() {
    cd "${pkgbase}"
    install -Dm644 GeistPixel/ttf/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_ttf-geist-pixel-variable() {
    cd "${pkgbase}"
    install -Dm644 GeistPixel/variable/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
