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
pkgver=1.8.1
pkgrel=1
pkgdesc="A new font family for Vercel, created by Vercel in collaboration with Basement Studio"
arch=('any')
url="https://vercel.com/font"
license=('OFL-1.1')
source=("https://github.com/vercel/geist-font/releases/download/v${pkgver}/${pkgbase}-v${pkgver}.zip")
sha256sums=('70f42c1452fb6df12ea183e20a65999157354f91d11dac18b4c713e383808ec2')

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
