# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='revanced-cli'
pkgver="1.4.2"
pkgrel=2
pkgdesc='Command line application as an alternative to the ReVanced Manager'
arch=('x86_64')
url="https://github.com/revanced/revanced-cli"
license=('GPL3')
depends=('java-environment')
install='revanced-cli.install'
source=("${pkgname}.sh"
        "${url}/releases/download/v${pkgver}/revanced-cli-${pkgver}-all.jar"
        "${url}/raw/v${pkgver}/LICENSE")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 revanced-cli-${pkgver}-all.jar "${pkgdir}/usr/share/java/${pkgname}.jar"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
