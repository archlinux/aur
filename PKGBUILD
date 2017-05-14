# Maintainer: Johannes Janosovits <johannes@walnutempire.de>
pkgname=ttf-maven-pro
pkgver=2.002
pkgrel=2
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
sha256sums=('a1b53a4592d1ce74c2300a5be0f7029dabadd3b4f40fe0d69ebed393fb091043'
            'd727d0b1a6c72cd2766e11fbaf1d4fa3c2052abf655ae4d80f87fee8be2249b0'
            '904a686385a67ae4832b9864d663b28464d613bd54cd2d0655440a4f574228e2'
            'bf418d6ad32714865b5578038ed90daac4327599f3dd262361584eb05ff54790')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
  install -m 644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}
