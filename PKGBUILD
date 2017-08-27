# Maintainer: Johannes Janosovits <johannes@walnutempire.de>
pkgname=ttf-maven-pro
pkgver=2.003
pkgrel=3
pkgdesc='Sans-serif typeface from Google Fonts'
arch=('any')
url='https://fonts.google.com/specimen/Maven+Pro'
license=('SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=ttf-maven-pro.install
source=('https://raw.githubusercontent.com/google/fonts/master/ofl/mavenpro/MavenPro-Black.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/ofl/mavenpro/MavenPro-Bold.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/ofl/mavenpro/MavenPro-Medium.ttf'
        'https://raw.githubusercontent.com/google/fonts/master/ofl/mavenpro/MavenPro-Regular.ttf')
sha256sums=('b46bec61d4507bd08fdda0bf61a07b9241303a13b77be559aff464a93d521dba'
            'e82c642ee161c25efa6fc56bf9612a2ddf655900cb85bb85c9c40af02b67108b'
            '37f1e21c1280b56e5274ca9ac990a1f3b446461047e72ba96d95fef3ea46fbb6'
            '347bf2e1fd448c075e39601109ba2fb46a624e7151c9d7f160edb7a38b7e7351')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
  install -m 644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
