# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Co-Maintainer: Matthias Loibl <mail@matthiasloibl.com>

pkgname=jsonnet-bundler-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="jsonnet package manager"
arch=('x86_64')
url="https://github.com/jsonnet-bundler/jsonnet-bundler"
license=('Apache')
source=("jb-v${pkgver}::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
sha256sums=('78e54afbbc3ff3e0942b1576b4992277df4f6beb64cddd58528a76f0cd70db54')

package() {
  install -Dm 755 "${srcdir}/jb-v${pkgver}" "${pkgdir}/usr/bin/jb"
}
