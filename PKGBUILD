# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=datawire-forge
pkgver=0.4.15
pkgrel=1
pkgdesc="Define and run multi-container apps in Kubernetes http://forge.sh"
arch=('x86_64')
url="https://forge.sh/"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "forge::https://s3.amazonaws.com/datawire-static-files/forge/${pkgver}/forge"
    )
sha256sums_x86_64=(
    '4c2bbb524a359d74f0f4bf7232b543674830b1d713296c3b3924104ccc701b51'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 -t "${pkgdir}/usr/bin/" forge
}

