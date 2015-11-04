# Maintainer: Marcin Wieczorek marcin@marcin.co
pkgname=screenshooter
pkgver=5.30
pkgrel=1
pkgdesc="Take a screenshot and share it with your friends"
arch=('x86_64' 'i686')
url=""
license=('Freeware')
groups=()
depends=(
	"qt5-x11extras"
)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i686=("http://kosz.marcin.co/dl/$pkgname-$pkgver-i686.tar.gz" "icon.png" "screenshooter.desktop")
source_x86_64=("http://kosz.marcin.co/dl/$pkgname-$pkgver-x86_64.tar.gz" "icon.png" "screenshooter.desktop")
noextract=()
md5sums_x86_64=('c3bfe2a6e369060af02c05759ed4ab0a'
                '9f3d281a63a047b7c90272264916561c'
                '23ba3762ff952ae7ab695285c227297e')
md5sums_i686=('2a1216daf992e4a6e213474aad702be3'
              '9f3d281a63a047b7c90272264916561c'
              '23ba3762ff952ae7ab695285c227297e')

package() {
  cd "$pkgname-$pkgver-$arch"
  install -D -m755 "ScreenShooter5"         "${pkgdir}/usr/bin/ScreenShooter5"

  cd "../"
  install -D -m644 "screenshooter.desktop" "${pkgdir}/usr/share/applications/screenshooter.desktop"
  install -D -m644 "icon.png"     "${pkgdir}/usr/share/pixmaps/screenshooter.png"

  #sudo desktop-file-install screenshooter.desktop
}
