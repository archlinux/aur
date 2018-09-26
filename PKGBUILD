# Contributor: orumin <dev at orum.in>

pkgname=ttf-koruri
pkgver=20180915
pkgrel=1
pkgdesc="Japanese TrueType font obtained by mixing M+ and Open Sans"
arch=('any')
url="https://github.com/Koruri/Koruri"
license=('APACHE')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("https://github.com/Koruri/Koruri/releases/download/Koruri-20180915/Koruri-20180915.tar.xz")
sha256sums=('9cfd9a867f60b8da8653b87706b9bafc113bb477b5e72d1095f43117f7fb3366')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "Koruri-${pkgver}"/*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
