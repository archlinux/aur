# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=code-marketplace
pkgver=1.54.3
pkgrel=2
pkgdesc='Enable vscode marketplace in Code OSS'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('code-features')
install="${pkgname}.install"
source=('code-marketplace.hook'
        'patch.sh')
md5sums=('2f5ebcc1795bb5eac95162059a9a496e'
         'ee4895ec25de5fe68c0f60c66fa8ac9f')

package() {
  install -Dm 644 "${srcdir}"/code-marketplace.hook "${pkgdir}"/usr/share/libalpm/hooks/code-marketplace.hook
  install -Dm 755 "${srcdir}"/patch.sh "${pkgdir}"/usr/share/code-marketplace/patch.sh
}
