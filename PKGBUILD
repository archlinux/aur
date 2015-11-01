# Maintainer: TyanNN sashavini2000@gmail.com
pkgname=svkm
pkgver=1.2
pkgrel=1
pkgdesc="Simple Vkontakte console messanger"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('python>=3.0')
makedepends=('python-pip')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://drive.google.com/uc?export=download&confirm=no_antivirus&id=0B4YjcQAoes55MTJ5Z0xGNWNMdEU')
md5sums=('45f25b48f8ef7f27c6cfcfc30cf8837c)

package() {
  echo "Installing VK API"
  sudo pip install vk
  cd "$srcdir"
  mv  'uc?export=download&confirm=no_antivirus&id=0B4YjcQAoes55MTJ5Z0xGNWNMdEU' svkm.py
  install -D -m755 $srcdir/svkm.py $pkgdir/usr/bin/svkm
  
}

# vim:set ts=2 sw=2 et: 
