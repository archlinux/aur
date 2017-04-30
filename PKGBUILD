# Maintainer: degreeme <suratovvlad@gmail.com>

pkgname=etxt-antiplagiat-bin
pkgver=2.0.97.0
pkgrel=2
pkgdesc="The russian system to search plagiarism in science texts."
arch=('x86_64')
url="https://www.etxt.ru/"
license=('none')
depends=('lib32-libxcomposite' 'lib32-libxslt' 'lib32-gstreamer0.10-base')
options=(!strip)
source=("https://www.etxt.ru/downloads/cross/ru/linux/etxt_antiplagiat.zip")
sha512sums=('60b448b4a7ff0af1c834103475c86688ffed5508361c1dd20a513801d80e615861e04b75d9355b463d2994f072bb8a0748353e0bb79cfe84f0584d0931e19d43')

package() {
  cd $srcdir
  install -dm 755 $pkgdir/opt/$pkgname
  cp -dr --no-preserve=ownership $srcdir/EtxtAntiplagiat/* $pkgdir/opt/$pkgname
}