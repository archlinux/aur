# Maintainer: d3spair <aur@agrshv.dev>

pkgname=ghorg-bin
pkgver=1.11.4
pkgrel=1
pkgdesc='allows you to quickly clone all of an orgs, or users repos into a single directory.'
arch=('x86_64')
url='https://github.com/gabrie30/ghorg'
license=('Apache-2.0')
source=("${pkgname}_${pkgver}_Linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/ghorg_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('36c724d8ed58fb475bf1e9d2f71e0129622ac82c1bbf965cc45ba55e401edf17')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"

  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname/-bin/}/"
}
