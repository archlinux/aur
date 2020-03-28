# Maintainer: tritonas00 <tritonas00@gmail.com>

pkgname=rigsofrods-bin
pkgver=2020.01
pkgrel=1
pkgdesc='An open source vehicle simulator based on soft-body physics'
arch=('x86_64')
url='https://www.rigsofrods.org'
license=('GPLv3')
depends=('openal' 'nvidia-cg-toolkit' 'openjpeg2')
conflicts=('rigsofrods' 'rigsofrods-git' 'rigsofrods-noangelscript-git')
source=('http://archives.rigsofrods.net/downloads/rigs-of-rods-linux-2020.01.zip' 'rigsofrods-bin' 'RoR.desktop' 'rigsofrods.png')
md5sums=('ac4f0d6be8921c71ae84d1bddd0defa2'
         '18a93ef64b00447ebd4339673731ce05'
         'd08fa6b90c78d12de7772b15af0380a4'
         'eb771473d8e14a8814c6d1d68f25f02d')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt/rigsofrods-bin"
  cp -r bin "${pkgdir}/opt/rigsofrods-bin/bin"
  cp -r lib "${pkgdir}/opt/rigsofrods-bin/lib"
  install -Dm755 rigsofrods-bin "$pkgdir/usr/bin/rigsofrods-bin"
  install -Dm755 RoR.desktop "$pkgdir/usr/share/applications/RoR.desktop"
  install -Dm755 rigsofrods.png "$pkgdir/usr/share/pixmaps/rigsofrods.png"
}
