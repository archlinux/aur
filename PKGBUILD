# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Original Maintainer: Icelk <main at icelk.dev>
# Original Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>
# Previous Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>
# Maintainer: G'lek Tarssza <glek at glektarssza dot com>

pkgname=vscodium-insiders-marketplace
pkgver=1.105.06780
pkgrel=1
pkgdesc='Enable the VSCode Marketplace in vscodium-insiders.'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-insiders' 'python')
install="${pkgname}.install"
source=('vscodium-insiders-marketplace.hook'
        'patch.py')
sha512sums=('1330368d4ad7e875f943d9e8fc49c9737b659111647e418aadd9f39bfe18c541c92d02a9a6f11bc824769557e4e4b965782f66548872245132a418a08b37c3b0'
            '87c08ee0ad0e3701459c749234f7d243e6c42c9bc178843898cf414b2754688bd8f1a9abd16f2e0d917f81f9f63e0a3641aa61f73f56a7cf81541820dcdf7a8e')

package() {
  install -Dm 644 "${srcdir}"/vscodium-insiders-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-insiders-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/vscodium-insiders/resources/app/patch.py
}
