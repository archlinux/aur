# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=thunar-secure-delete
pkgver=0.9
pkgrel=1
pkgdesc="Secure Erase Menu Item for Thunar"
arch=('any')
url="https://github.com/GIJack/secure_delete_thunar"
license=('GPLv3')
depends=('xdialog' 'secure-delete' 'libnotify')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/secure_delete_thunar/archive/${pkgver}.tar.gz")
sha256sums=('e884dec4f9d6dbfb144a5f46575af35d92f402e610a97adc645028731314bc20')

package() {
  cd "secure_delete_thunar-${pkgver}"
  ./install.sh --root "${pkgdir}" --base-dir "usr/" install
}

