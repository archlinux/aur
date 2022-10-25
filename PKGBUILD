# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Anthony HAMON <hamon.anth@gmail.com>
pkgname=yogo
pkgver=3.7.1
pkgchecksum=0a3d4a29793d17f907ef5c5af5b4f753
pkgrel=1
pkgdesc="Interact with yopmail from command-line"
arch=('x86_64')
url="https://github.com/antham/yogo"
license=('GPL')
source=("https://github.com/antham/yogo/releases/download/v${pkgver}/yogo_${pkgver}_linux_amd64.tar.gz")
md5sums=($pkgchecksum)

package() {
    tar xf "yogo_${pkgver}_linux_amd64.tar.gz"
    install -Dm755 "yogo" "${pkgdir}/usr/bin/${pkgname}"
}
