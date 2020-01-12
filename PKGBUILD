# Contributor: liberodark

pkgname=yosoro-bin
pkgver=1.1.7
pkgrel=1
pkgdesc="Beautiful Cloud Drive Markdown NoteBook Desktop App."
arch=('x86_64')
url="https://github.com/IceEnd/Yosoro"
license=('GPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/IceEnd/Yosoro/releases/download/v${pkgver}/Yosoro-linux.deb")
sha512sums_x86_64=('c15e5c44dfbc795339af57998607e6bf2e58710512426e47f7805447c69dfdc0938eb820443a6ed8dd6e9fbad06186c3ac147d139373093313d5f1dda5730797')
        
package() {
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

