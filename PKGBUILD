# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Co-Maintainer: Matthias Loibl <mail@matthiasloibl.com>

pkgname=jsonnet-bundler-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="jsonnet package manager"
arch=('x86_64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
source=("jb-v${pkgver}::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
sha256sums=('f5bccc94d28fbbe8ad1d46fd4f208619e45d368a5d7924f6335f4ecfa0605c85')

package() {
  install -Dm 755 "${srcdir}/jb-v${pkgver}" "${pkgdir}/usr/bin/jb"
}
