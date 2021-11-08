# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

epoch=1
pkgver=17
pkgrel=1

pkgname=jdk-adoptopenjdk
pkgdesc="DEPRECATED: Transition package. Please use jdk-temurin instead."
arch=('any')
url='https://adoptopenjdk.net'
license=('Unlicense')

depends=('jdk-temurin')
install=install_jdk-adoptopenjdk.sh

package() {
    install -dm 755 ${pkgdir}/usr/lib/jvm
    ln -sf /usr/lib/jvm/java-${pkgver}-temurin ${pkgdir}/usr/lib/jvm/java-${pkgver}-adoptopenjdk
}
