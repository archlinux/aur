# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-spline-sans
pkgver=1.001
pkgrel=1
_commit='d524ab0d587c5067a17284918cd5f144ac521ec9'
pkgdesc="Grotesque sans serif typeface family, purpose-built for UI interfaces, checkout processes, and paragraphs of text"
arch=('any')
url="https://github.com/SorkinType/SplineSans"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/ttf/SplineSans-Bold.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSans-Light.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSans-Medium.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSans-Regular.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSans-SemiBold.ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('3b47e125ec1b70d748272c83b12cc673099fbf65ea40b94f24ef1bb0b599be8b'
            '15b2f07ac7479657771245b69d9ab61910a875394ec1944b075e22a87dc2a0c2'
            '964b04e350d69aac4c75bdc892f592f85e99c2cf985e09c8bc1d2a13314d7ad8'
            '7313ca24903fbdee49a9a20c551f213dfaf86a2ced1948e71e919ef899960674'
            '10b3c62d5cc50fac8c76d9478d18b065f86af4490f9bea256d4be66dd8ab769a'
            '45b2aa0796f435bd620d864b6b44ff08855dc575524f23ffb43161e69cb5dbfc')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
