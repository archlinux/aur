# Maintainer: Zoron <zoronlivingston@gmail.com>

pkgname=sddm-chinese-painting-theme
pkgver=0.1.0
pkgrel=1
pkgdesc="Chinese style SDDM theme"
arch=('any')
url="https://github.com/fralonra/sddm-chinese-painting-theme"
license=('GPL3')
depends=('sddm' 'qt5-graphicaleffects')
source=("https://github.com/fralonra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('916b173fceefa45e1d8786abd4b673d4')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  sudo cp -r chinese-painting/ /usr/share/sddm/themes/

  echo "Installation completed"
}
