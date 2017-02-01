# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=ttf-oxygen-gf
pkgver=r470.49fbebd
pkgrel=1
pkgdesc='Oxygen and Oxygen Mono fonts from the Google Fonts catalog'
arch=(any)
url=https://github.com/google/fonts
license=(custom:OFL)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontdir xorg-mkfontscale)
provides=(ttf-font ttf-oxygen ttf-oxygen-git)
conflicts=(ttf-google-fonts-git ttf-oxygen ttf-oxygen-git)
source=(OFL.txt Oxygen-Bold.ttf Oxygen-Light.ttf Oxygen-Regular.ttf OxygenMono-Regular.ttf)
sha512sums=('ea77302599c998d8e84ff47481482d6939ec7c6d15c2ff99422361a870f7faf56f111b3ff0ce2ab9baea4b1bd010f76b76d87408ee92170204fdc31bb0cb5e46'
            '20e8f86bf9fa2733a48710f7a4ab950dd0ac574185c8244a5f13c5f08d2f95c8213df1a2ff02f784b108229462449a3a0f4f2789b04476471705be2443f8bdf4'
            'a9691df4df54ebf3832b03135c617edc2a8b30447fe0c16b5d1b43964b231cd3344bf682e465d50487c96c3b16be19857f29b1db0bc24245b0e6f29818608a1d'
            '3b8c76923d303da7b828d3ba62a538db96e64bddf5391079ead0ebf62904ba7a3d286cf11bacd24d8665ea5d5495c1d6db3c8b2f806e9f87ac841ebfd5cbb4d5'
            '5e0a7efb11da9e64b3a1709b090335ff324b1a4b1313a33bede6c0048da99b7e18398f8841cc2d4db00c2ba1ff0028d589dc245421d1ef0045beb1a4f0778f7d')

package() {
    cd "${srcdir}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" OFL.txt
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" Oxygen-Bold.ttf Oxygen-Light.ttf Oxygen-Regular.ttf OxygenMono-Regular.ttf
}
