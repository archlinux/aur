# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Co-Maintainer: Matthias Loibl <mail@matthiasloibl.com>

pkgname=jsonnet-bundler-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="jsonnet package manager"
arch=('x86_64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
source=("jb-v${pkgver}::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
sha256sums=('e5499cf0a1fcb247381421cdc3b09cc4e37129fd97dfdf2d53531071c4218292')

package() {
  install -Dm 755 "${srcdir}/jb-v${pkgver}" "${pkgdir}/usr/bin/jb"
}
