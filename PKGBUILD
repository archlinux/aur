# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>

pkgname=lib32-openmotif
pkgver=2.3.6
pkgrel=1
_pkgrel32=1
pkgdesc="Open Motif for x86_64 architecture"
arch=('x86_64')
url="http://www.motifzone.org/"
license=('GPL')
depends=('lib32-libxp' 'lib32-libxft' 'lib32-libxmu' 'lib32-libjpeg-turbo')
source=("http://mirrors.kernel.org/archlinux/community/os/i686/${pkgname/lib32-/}-${pkgver}-${_pkgrel32}-i686.pkg.tar.xz")
sha256sums=('9f50053ed4067222295a51e6f78e3aade8f41f237866e0113ab6854e6defe607')

package()
{
  install -d "${pkgdir}/usr/lib32"
  cp -dpR --no-preserve=ownership "${srcdir}"/usr/lib/* "${pkgdir}/usr/lib32"
}
