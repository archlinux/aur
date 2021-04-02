# Maintainer: Carson Rueter <roachh at proton mail dot com>
pkgname=vscodium-bin-marketplace
pkgver=1.55.0
pkgrel=2
pkgdesc='Enable vscode marketplace in vscodium-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-bin')
install="${pkgname}.install"
source=('vscodium-bin-marketplace.hook'
        'product.json.patch')
md5sums=('19f2e30388b77ce126fc0a3ac138efd4'
         '239ae0c947b1e7b8d023f4f6679c2d9d')
package() {
  install -Dm 644 "${srcdir}"/vscodium-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-bin-marketplace.hook
  install -Dm 644 "${srcdir}"/product.json.patch "${pkgdir}"/usr/share/vscodium-bin/resources/app/product.json.patch
}

