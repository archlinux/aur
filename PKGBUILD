# based on vscodium-marketplace
# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Original Maintainer: Icelk <main at icelk.dev>
# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>

pkgname=vscodium-marketplace
pkgver=1.59.0
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium' 'sed')
install="${pkgname}.install"
source=('vscodium-marketplace.hook'
        'patch.sh')
md5sums=('c4b0dc2ddfb8788415344fc0e528c002'
         'b93f0158ea7dd0880420a15ba135854c')
package() {
  install -Dm 644 "${srcdir}"/vscodium-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/vscodium/resources/app/patch.sh
}

