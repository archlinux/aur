# Maintainer: Carson Rueter <roachh at proton mail dot com>
pkgname=vscodium-bin-marketplace
pkgver=1.51.1
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code>=1.50.1')
install="${pkgname}.install"
source=('vscodium-bin-marketplace.hook'
        'product.json.patch')
md5sums=('3579c73f400410130ece9b778b0454cc'
         'ad931bb9a31181ef65197008d84ad885')
package() {
  install -Dm 644 "${srcdir}"/vscodium-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-bin-marketplace.hook
  install -Dm 644 "${srcdir}"/product.json.patch "${pkgdir}"/usr/share/vscodium-bin/resources/app/product.json.patch
}

