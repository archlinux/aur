# Maintainer: Liam Chelton <liamchelton at gmail.com>

pkgname=zfsbootmenu-sb
pkgver=0.3
pkgrel=2
pkgdesc="Hooks for signing ZFSBootMenu for use with Secure Boot."
arch=('any')
url="https://github.com/KorewaKiyo/zfsbootmenu-sb"
license=('GPL2')
depends=('sbsigntools' 'perl')
optdepends=("zfsbootmenu: For ZBM"
            "zfsbootmenu-efi-bin: For ZBM")
makedepends=('git')
sha256sums=('SKIP')
source=("git+https://github.com/KorewaKiyo/zfsbootmenu-sb.git")
package() {
  cd zfsbootmenu-sb
  make DESTDIR="${pkgdir}" install
}
