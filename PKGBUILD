# Maintainer: Carson Rueter <roachh at proton mail dot com>
# Maintainer: Icelk <main at icelk.dev>

pkgname=vscodium-bin-marketplace
pkgver=1.55.2
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium-bin'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium-bin')
install="${pkgname}.install"
source=('vscodium-bin-marketplace.hook'
        'product.json.patch')
md5sums=('2c635fa01e6d65a08f1e6652c6ea5873'
         '5bae996372d576793bf426a42133a541')
package() {
  install -Dm 644 "${srcdir}"/vscodium-bin-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/vscodium-bin-marketplace.hook
  install -Dm 644 "${srcdir}"/product.json.patch "${pkgdir}"/usr/share/vscodium-bin/resources/app/product.json.patch
}

