# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.50.1
pkgrel=1
pkgdesc='Enable vscode marketplace in Code OSS'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code>=1.50.1')
install="${pkgname}.install"
source=('code-marketplace.hook'
        'product_json.patch')
md5sums=('8a5cbd751ee2762d40f1e43e9e6e69e0'
         '9e476c8aae4243010d6a1c18e56ac402')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 644 "${srcdir}"/product_json.patch "${pkgdir}"/usr/lib/code/product_json.patch
}
