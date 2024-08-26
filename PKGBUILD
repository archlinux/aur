# Maintainer: Arghyadip Chakraborty <dev@arghyac.com>

pkgname=vlab-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="A desktop client for Vlabs by Bodhitree"
arch=(x86_64)
url="https://github.com/bodhitree-iitb/clab-installation"
options=(!debug)
depends=(docker git python)
source=("https://github.com/bodhitree-iitb/clab-installation/releases/download/v${pkgver}/VLab_${pkgver}-linux.deb")
sha512sums=('a7440def33a9ceeb4e7b54e42f7a51687967d9d80c708f8df10176ebeb1f1f67c69930629754e90e8da3bf329a44f66c02f5af22f5b27ecef9cdfeecca2474cd')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}
