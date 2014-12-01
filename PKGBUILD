# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=eric4-i18n
pkgver=4.5.25
pkgrel=1
pkgdesc="Translations for the Eric IDE (cs-de-es-it-fr-ru-tr-zh_cn)"
arch=('any')
url="http://eric-ide.python-projects.org/index.html"
license=('GPL')
depends=('eric4')
source=(http://downloads.sourceforge.net/eric-ide/eric4-i18n-cs-$pkgver.tar.gz
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-de-$pkgver.tar.gz
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-es-$pkgver.tar.gz
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-fr-$pkgver.tar.gz
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-it-$pkgver.tar.gz
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-ru-$pkgver.tar.gz
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-tr-$pkgver.tar.gz
        http://downloads.sourceforge.net/eric-ide/eric4-i18n-zh_CN.GB2312-$pkgver.tar.gz)
md5sums=('7e62ddae2bd85fe14888dbbf4a8c4f2f'
         '6fdde79ecaf8d19c12078406d0f72b80'
         'f97682c7b1eb973b07f1c7c5e55e5280'
         'd2995d9157c3adbcc2673479155492e2'
         '2c4d8776010fe03888453051f717286c'
         'fc45341b525363af7f8abe6e731515d9'
         'caf114f5c217125b6567fb71dbd9d7bf'
         '4b6bc9dd37a002be1b8adf3ddb489bc3')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/lib/python2.7/site-packages/eric4/i18n
  install -m644 "${srcdir}"/eric4-$pkgver/eric/i18n/* \
    "${pkgdir}"/usr/lib/python2.7/site-packages/eric4/i18n
}
