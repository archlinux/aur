# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: Icelk <main at icelk.dev>

pkgname=vscodium-bin-marketplace
pkgver=1.56.0
pkgrel=3
pkgdesc='Enable vscode marketplace in vscodium-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-bin' 'sed')
install="${pkgname}.install"
source=('vscodium-bin-marketplace.hook'
        'patch.sh')
md5sums=('3c5f596c01aec593f880031d21b949b4'
         '9953b36f67bee0466c28a07e1faf090e')
package() {
  install -Dm 644 "${srcdir}"/vscodium-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-bin-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/vscodium-bin/resources/app/patch.sh
}

