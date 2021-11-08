# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

epoch=1
pkgver=11
pkgrel=1

pkgname=jdk11-adoptopenjdk
pkgdesc="DEPRECATED: Transition package. Please use jdk11-temurin instead."
arch=('any')
url='https://adoptopenjdk.net'
license=('Unlicense')

depends=('jdk11-temurin')
install=install_jdk11-adoptopenjdk.sh

package() {
    install -dm 755 ${pkgdir}/usr/lib/jvm
    ln -sf /usr/lib/jvm/java-${pkgver}-temurin ${pkgdir}/usr/lib/jvm/java-${pkgver}-adoptopenjdk
}
