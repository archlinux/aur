# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-myrica
pkgver=2.010.20160103
pkgrel=1
pkgdesc="Japanese font family for developers obtained by mixing Inconsolata and Genshin Gothic"
url="http://myrica.estable.jp/"
license=('Apache' 'custom:OFL')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(Myrica.zip::https://github.com/tomokuni/Myrica/blob/0ea367cbd9034775454334aa6ce3b1d16796a330/product/Myrica.zip?raw=true)
md5sums=('d85ab451d7c90cec714f20ff417f145b')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.TTC "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE_*.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
