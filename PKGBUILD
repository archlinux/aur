# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-mutsuki
pkgver=14.10
pkgrel=1
pkgdesc="Japanese classic style font."
url="http://mandel59.github.io/mutsuki/"
license=('custom')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(Mutsuki.ttf::'http://mandel59.github.io/mutsuki/Mutsuki.ttf' LICENSE::'https://github.com/mandel59/mutsuki/blob/master/LICENSE?raw=true')
noextract=('Mutsuki.ttf' 'LICENSE')
md5sums=('84a9e8a6edba162292983ed3aefe2cd6' SKIP)

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
