# Maintainer: Viktor Tiulpin <viktor.tiulpin@jetbrains.com>
pkgname=teamcity-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A command-line interface for TeamCity CI/CD server"
arch=('x86_64' 'aarch64')
url="https://github.com/JetBrains/teamcity-cli"
license=('Apache-2.0')
provides=('teamcity')
conflicts=('teamcity')
source_x86_64=("${url}/releases/download/v${pkgver}/teamcity_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/teamcity_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a9470aee1f35b835535eacd35850146dd0c2a5a1bb56d38ca0634f4159c12e0e')
sha256sums_aarch64=('09c92fe44432afa33864befb58f1c804ed8915a2fee29ee917087d6ae23835e0')

package() {
    install -Dm755 teamcity "${pkgdir}/usr/bin/teamcity"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
