# Maintainer: William Varmus <0@willvar.tw>

pkgname=ttf-kerberos-variable
pkgver=1.4.1
pkgrel=1
pkgdesc='Variable serif font family for long-form reading on paper and screens'
arch=('any')
url='https://jul-sh.github.io/Kerberos/'
license=('OFL-1.1-RFN')
conflicts=('ttf-kerberos')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/jul-sh/Kerberos/releases/download/v${pkgver}/Kerberos-${pkgver}.zip"
)
sha256sums=('3c07e99c092acbe1552133898127a581a492f74d1e326cc834e081e6f175002f')

package() {
  install -Dm644 "${srcdir}/Kerberos-${pkgver}/variable/"*.ttf \
    -t "${pkgdir}/usr/share/fonts/${pkgname}"
  install -Dm644 "${srcdir}/Kerberos-${pkgver}/OFL.txt" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
