# Maintainer: Sergey Elpashev <mrsedan at nwaifu dot su>
pkgname=smokeinstaller
_pkgname=smokeapi-installer
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI installer for SmokeAPI'
arch=('any')
url='https://github.com/acidicoala/SmokeAPI'
license=('MIT')
depends=('python')
install="${pkgname}.install"
source=(
  "smokeinstaller-${pkgver}-${pkgrel}-any.tar.gz::https://git.nwaifu.su/neuro_llc/SmokeAPI-Installer/archive/v${pkgver}.tar.gz"
)
sha256sums=('bddf4bee86d5a78de9cad1f4c784340c1df242a2837b6f0d2277df576ca1734b')

package() {
  install -Dm755 "$srcdir/${_pkgname}/installer.py" "$pkgdir/usr/bin/smokeinstaller"
  install -Dm644 "$srcdir/${_pkgname}/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
