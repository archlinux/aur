# Maintainer: pineappletoad

pkgname=gama-bin
pkgver=2.33
_pkgrel_src=1
pkgrel=1
pkgdesc="Package dedicated to the adjustment of surveying networks. (precompiled)"
arch=('x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL-3.0-or-later')
options=('!debug')
provides=('gama')
conflicts=('gama')
depends=('expat' 'glibc' 'sqlite' 'gcc-libs')

source=("https://github.com/tubbywrestler/gama-bin/releases/download/${pkgver}-${_pkgrel_src}/gama-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('5eddaa2ef59502fb03342bf747429286adf364d1b1418b1c4a9e005a9a15be34')

package() {
    bsdtar -xf "${srcdir}/gama-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
