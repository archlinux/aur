# Maintainer: Suren Kirakosyan <surenkirakosyan.am@gmail.com>

pkgname=sarqx-reporter
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI application."
arch=(i686 x86_64)
url="git@gitlab.com/sarqx_group/sarqx-reporter"
license=('GPL')
sha256sums=('SKIP')

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.rb" "${pkgdir}/usr/bin/${pkgname}"
}
