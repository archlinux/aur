# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=ttf-dejavu-sans-code
pkgver=1.2.2
pkgrel=2
pkgdesc='Monospaced font with programming ligatures based on DejaVu Sans Mono.'
arch=('any')
url='https://github.com/SSNikolaevich/DejaVuSansCode'
license=('custom')
source=("https://github.com/SSNikolaevich/DejaVuSansCode/releases/download/v${pkgver}/dejavu-code-ttf-${pkgver}.tar.bz2")
sha256sums=('1be8f5709408692e97fd5016fe550d20594d9fc484f93e82743432037da99b20')

package() {
  cd ${srcdir}/dejavu-code-ttf-${pkgver}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
