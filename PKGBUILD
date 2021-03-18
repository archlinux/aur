# Maintainer: Carson Rueter <roachh at proton mail dot com>
pkgname=vscodium-bin-marketplace
pkgver=1.54.3
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-bin')
install="${pkgname}.install"
source=('vscodium-bin-marketplace.hook'
        'product.json.patch')
md5sums=('3579c73f400410130ece9b778b0454cc'
         '9186e843742eff89896d5b0d01bba25e')
package() {
  install -Dm 644 "${srcdir}"/vscodium-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-bin-marketplace.hook
  install -Dm 644 "${srcdir}"/product.json.patch "${pkgdir}"/usr/share/vscodium-bin/resources/app/product.json.patch
}

