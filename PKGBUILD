# Maintainer: pzl <alsoelp@gmail.com>
# Contributor: Pablo Olmos de Aguilera C. <pablo at glatelier dot org>
# Contributor: David Goodlad <david at goodlad dot ca>
# Contributor: William Sheldon <tang0th at gmx dot com>

pkgname=ttf-meslo
_pkgname=Meslo
pkgver=1.2.1
pkgrel=1
pkgdesc="Meslo LG is a customized version of Apple's Menlo font (includes DZ version)"
arch=('any')
url="http://github.com/andreberg/Meslo-Font"
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-meslo.install
source=(
$_pkgname-${pkgver}.zip::https://github.com/andreberg/Meslo-Font/blob/master/dist/v${pkgver}/Meslo%20LG%20v${pkgver}.zip?raw=true
$_pkgname-${pkgver}-DZ.zip::https://github.com/andreberg/Meslo-Font/blob/master/dist/v${pkgver}/Meslo%20LG%20DZ%20v${pkgver}.zip?raw=true
)
sha256sums=('d0bcb7668dda8fa1a0f8162d626adb434c32854e243b5bd52a717cf569af08d0'
            'e5201a6816281872c23a2b2f43ac91dc8c1f9d91e9f4b82d64e9bfcb769ecb52')

package()
{
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/Meslo\ LG\ v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF/
  install -m644 $srcdir/Meslo\ LG\ DZ\ v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF/
}
