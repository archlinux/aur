# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=thunar-secure-delete
pkgver=0.9.1
pkgrel=1
pkgdesc="Secure Erase Menu Item for Thunar"
arch=('any')
url="https://github.com/GIJack/secure_delete_thunar"
license=('GPLv3')
depends=('xdialog' 'secure-delete' 'libnotify')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/secure_delete_thunar/archive/${pkgver}.tar.gz")
sha256sums=('cff5e5f0f157a1d3682f864932865c6bbe5ff35753e7c4d55fae4e1a8bd75a4b')

package() {
  cd "secure_delete_thunar-${pkgver}"
  ./install.sh --root "${pkgdir}" --base-dir "usr/" install
}

