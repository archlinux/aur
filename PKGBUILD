# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
_realname=hovr
pkgname=$_realname-git
pkgver=1
pkgrel=1
pkgdesc="A Blender Game Engine Demo for the Oculus Rift and the Nintendo Balance Board"
arch=('i686' 'x86_64')
url="https://github.com/lubosz/python-rift"
license=('GPLv3')
depends=('blender' 'python-balanceboard-git' 'python-rift-git')
source=("git+https://github.com/lubosz/$_realname.git")
md5sums=('SKIP')
 
package() {
  cd $_realname
  mkdir -p $pkgdir/usr/share/$_realname/
  mkdir -p $pkgdir/usr/bin/
  cp * $pkgdir/usr/share/$_realname/ -R
  echo "blender /usr/share/$_realname/HoVR.blend" > $pkgdir/usr/bin/hovr
  chmod +x $pkgdir/usr/bin/hovr
}
