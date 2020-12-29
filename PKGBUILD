# Maintainer: Tyler Furby <tyler@theforge.xyz>
pkgname=renderman
pkgver=current
pkgrel=3
pkgdesc="Pixar's Renderman render engine."
arch=('x86_64')
url="https://renderman.pixar.com"
license=('unknown')
depends=('libidn')
makedepends=('rpmextract')
options=('emptydirs')
source=("https://storage.googleapis.com/pixar-renderman/RenderMan-InstallerNCR-23.5.0_2121399-linuxRHEL7_gcc63icc190.x86_64.rpm")
md5sums=('61b2b5c94a7ae4089e8b8408b8ab16f4')

package() {
	sudo mv "opt/pixar" /opt/
}

build() {
  cd "$src"
  rpmextract.sh RenderMan-InstallerNCR-23.5.0_2121399-linuxRHEL7_gcc63icc190.x86_64.rpm
}
