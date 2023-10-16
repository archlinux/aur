# Maintainer: Babakinha <babakinha@proton.me>
# Contributor: LuckilyFluffy <luckilyfluffy3579@gmail.com>
pkgname=protogen
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple rainbowy protogen in your terminal :3"
arch=('any')
url="https://github.com/Babakinha/${pkgname}"
depends=('sh' 'lolcat')
source=("https://github.com/Babakinha/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ad16a2e98fefd04615525c56a521ff15')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm755 "protogen" "${pkgdir}/usr/bin/protogen"
}
