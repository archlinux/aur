# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=ttf-dejavu-sans-code
pkgver=1.2
pkgrel=2
pkgdesc='Monospaced font with programming ligatures based on DejaVu Sans Mono.'
arch=('any')
url='https://github.com/SSNikolaevich/DejaVuSansCode'
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=fonts.install
source=("https://github.com/SSNikolaevich/DejaVuSansCode/releases/download/v${pkgver}/dejavu-code-ttf-${pkgver}.tar.bz2")
sha256sums=('812cb4881fd7e142682ae08dcfd0acf2858c2d4626623fc0174984685985206b')

package() {
  cd ${srcdir}/dejavu-code-ttf-${pkgver}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
