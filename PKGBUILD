# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.50.1
pkgrel=1
pkgdesc='Enable vscode marketplace in Code OSS'
arch=('any')
url='https://github.com/microsoft/vscode'
license=('unknown')
depends=('code')
install="${pkgname}.install"
source=('code-marketplace.hook'
        'product_json.patch')
md5sums=('a55c25aba17a6bf3f6e1327c853e8b35'
         '9e476c8aae4243010d6a1c18e56ac402')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 644 "${srcdir}"/product_json.patch "${pkgdir}"/usr/lib/code/product_json.patch
}
