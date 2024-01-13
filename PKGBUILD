# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=pacdate
pkgver=1.1.1
pkgrel=1

source=("https://github.com/Joseph-DiGiovanni/pacdate/archive/refs/tags/v${pkgver}.tar.gz")
        
sha256sums=('9db4d56e7a16841b9c3699ee52374a430e75f8b09ac61056b30c8be6360c154f')

pkgdesc="Automates downgrading packages to a specific date"
arch=('any')
url="https://github.com/Joseph-DiGiovanni/pacdate"
license=('GPL3')
depends=('pacman')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pacdate.sh" "${pkgdir}/usr/bin/pacdate"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
