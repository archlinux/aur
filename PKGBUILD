# Maintainer : nosada <ngsksdt@gmail.com>

pkgname=ttf-kibitaki
_fontname=Kibitaki
pkgver=20140621
pkgrel=1
pkgdesc="Japanese TrueType font for Programming"
arch=('any')
url="https://github.com/Koruri/kibitaki"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(https://github.com/Koruri/kibitaki/archive/Kibitaki-${pkgver}.tar.gz)
md5sums=('399158d054a57443dd803df61eb55e74')

package() {
    cd "${srcdir}/kibitaki-${_fontname}-${pkgver}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -D -m644 LICENSE.txt \
      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
