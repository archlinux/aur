# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=lima

pkgname=lima-bin
pkgver=2.3.0
pkgrel=2
pkgdesc="Linux virtual machines, typically on macOS, for running containerd."
arch=('x86_64')
url="https://github.com/lima-vm/lima"
license=('MIT')
provides=('lima')
conflicts=('lima')
source=("https://github.com/lima-vm/${_pkggit}/releases/download/v${pkgver}/${_pkggit}-${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('cc8ba97f1c801b899f7c9eda9919dfc4ce4fa2c140c53e5add15aa2d0a1936f9')

package() {
  cp -r "${srcdir}" "${pkgdir}"/usr
  find $pkgdir -iname "${_pkggit}-${pkgver}*" | xargs -r rm -rf
}
