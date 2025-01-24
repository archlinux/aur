# Maintainer: witt <1989161762 at qq dot com>

pkgname=fcitx5-theme-ohmyrime
pkgver=0.0.1
pkgrel=1
url='https://www.mintimate.cc'
pkgdesc='ohmyrime fcitx5 theme'
arch=('any')
license=('Apache-2.0')
conflicts=('fcitx5-theme-ohmyrime')
provides=('fcitx5-theme-ohmyrime')
options=('!strip')
source=(
    "themes-${pkgver}.zip::${url}/resources/ohMyRimeThemeForFcitx5.zip"
)
sha256sums=('4f49df49f88cf81cffc77c0c413208fa43e02cdcedb9715ae930954ae119f435')

package() {
    find -- */oh-my-rime-Light* -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/ohmyrime-light/" \;
    find -- */oh-my-rime-Dark* -type f -exec install -Dm644 {} -t "${pkgdir}/usr/share/fcitx5/themes/ohmyrime-dark/" \;

    # install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
