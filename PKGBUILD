# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Co-Maintainer: Matthias Loibl <mail@matthiasloibl.com>

pkgname=jsonnet-bundler-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="jsonnet package manager"
arch=('x86_64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
source=("jb-v${pkgver}::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
sha256sums=('433edab5554a88a0371e11e93080408b225d41c31decf321c02b50d2e44993ce')

package() {
  install -Dm 755 "${srcdir}/jb-v${pkgver}" "${pkgdir}/usr/bin/jb"
}
