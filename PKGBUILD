# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpstorm-url-handler

pkgname=phpstorm-url-handler
pkgver=0.0.1
pkgrel=1
pkgdesc="Open phpstorm:// URLs in PHPStorm."
url=''
arch=('any')
license=('GPL')
depends=('desktop-file-utils')
install=${pkgname}.install
source=(
  ${pkgname}
  ${pkgname}.desktop
  ${pkgname}.install
)
sha512sums=('bd64b622cf8c90118581a049b46de8d021dc371a85b78c3d4df7c4f0ad73a8b5cc0ff0aacb4692bcbebc39dc18ea7722ca220a8571b50ead451e98a014c4dc6a'
            '876e2f311513fc28f5ead55b42ef95a32ac0679069100d14327f768129977bb79295d11f337b20a2504f25eca73d2ddbbe344b85ae4ecb058e5ac2b9ded2175a'
            'e1894db2fd8c152562776cb404e0ddc302077d0434c46bef781a9519188b2b8fd50b679bd240299c85f69858f5f0bd4527a79d1091e6b7b626c69762a8a7f887')

package() {
  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  RPM_BUILD_ROOT=$pkgdir desktop-file-install $pkgname.desktop
}
