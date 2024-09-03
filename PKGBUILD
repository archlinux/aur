# Maintainer: Arghyadip Chakraborty <dev@arghyac.com>

pkgname=vlab-bin
_pkgname=VLab
pkgver=1.5.9
pkgrel=2
pkgdesc="A desktop client for Vlabs by Bodhitree"
arch=('x86_64')
url="https://github.com/bodhitree-iitb/clab-installation"
depends=('docker' 'git' 'python')
options=(!debug)
source=("${_pkgname}_${pkgver}-linux.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-linux.deb")
sha256sums=('3806ae276cb62fe09c17bc049120d8c32f7d7501d607a60d6df1cf5379c12109')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
