# Maintainer: BullShark <bullshark@expectusafterlun.ch>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=jrobo
_pkgname=JRobo
pkgver=2022.02.09
pkgrel=1
pkgdesc='Advanced IRC bot that uses its own IRC framework'
arch=('any')
url="https://github.com/BullShark/$_pkgname"
license=('GPL3')
depends=('java-runtime>=16')
optdepends=()
validpgpkeys=('031F7104E932F7BD7416E7F6D2845E1305D6E801')
source=("https://github.com/BullShark/$_pkgname/releases/download/$pkgver-$pkgrel/$_pkgname.tbz")
sha256sums=('87e706fbec7326e89863b5f50aeeedc8ca9788b102b32d15c4a98e48f04d8966')

package() {
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/usr/lib/JRobo.jar $pkgdir/usr/lib/JRobo.jar

  mkdir -p $pkgdir/usr
	cp -a $srcdir/usr/bin $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/$pkgname

  mkdir -p $pkgdir/usr/share/applications
  cp -a $srcdir/usr/share/applications/JRobo.desktop $pkgdir/usr/share/applications/JRobo.desktop

  mkdir -p $pkgdir/usr/share/pixmaps
  cp -a $srcdir/usr/share/pixmaps/jrobo.png $pkgdir/usr/share/pixmaps/jrobo.png
}

