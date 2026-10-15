# Maintainer: KSSJW

pkgname=zulu-25-jdk-fx
pkgver=25.36.205
pkgrel=1
pkgdesc="Azul Zulu JDK 25 with JavaFX"
arch=('x86_64')
url='https://www.azul.com/downloads'
license=('custom')

_filename="zulu25.36.205-ca-fx-jdk25.0.4.1-linux_x64"
source=(
  "https://cdn.azul.com/zulu/bin/${_filename}.tar.gz"
)
sha256sums=('dc541c82220402985ef4f646246235a55920f4493d79670eddaf33fa45a5c73c')

options=('!strip')

package() {
    local install_dir="${pkgdir}/usr/lib/jvm/${pkgname}"

    install -d "${install_dir}"

    cp -a "${srcdir}"/${_filename}/. "${install_dir}/"
}
