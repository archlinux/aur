# based on vscodium-marketplace
# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Original Maintainer: Icelk <main at icelk.dev>
# Previous Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>
# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=vscodium-marketplace
pkgver=1.97.0
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium' 'python')
install="${pkgname}.install"
source=('vscodium-marketplace.hook'
        'patch.py')
sha512sums=('8d729e8f7939aaefefb99c3c6d975f6f07d82b25bd5d7b364258c0c581a9d28a4a2dd3cfe203eeb338495f876885c3c6679d4127c8e045bcd720a0b0b5d4a78b'
            'aeb362390b0a2ca73f1059e39d8f7efdcc0451a44c8408fa4dc36d56e6aa7de6c09fbe78e87e1ab211b5f21edd6a7806499e576b41904d16f927e0307101bfb7')

package() {
  install -Dm 644 "${srcdir}"/vscodium-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.py "${pkgdir}"/usr/share/vscodium/resources/app/patch.py
}

