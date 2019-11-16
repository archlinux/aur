# Maintainer: Chun Yu <junyussh@gmail.com>
pkgname=quickapp-ide
pkgver=1.5.0
pkgrel=1
pkgdesc="quick app IDE for linux"
arch=("i386" "x86_64")
url="https://www.quickapp.cn/docCenter/IDEPublicity"
license=('custom')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://statres.quickapp.cn/quickapp/ide/${pkgname}-${pkgver}.deb")
noextract=()
md5sums=('22a380224d2d50b7b2d0f206cc6850e2')

prepare() {
  ar -x ${pkgname}-${pkgver}.deb
  mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"
}

package() {
  cd "$pkgname-$pkgver"
  # install -d opt/quickAppIDE
  # cp  opt/quickAppIDE ${pkgdir}
  # make DESTDIR="$pkgdir/" install
  cp -r ./ ${pkgdir}/
}
