# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>

pkgname=lib32-openmotif
pkgver=2.3.4
pkgrel=4
_pkgrel32=3
pkgdesc="Open Motif for x86_64 architecture"
arch=('x86_64')
url="http://www.motifzone.org/"
license=('GPL')
depends=('lib32-libxp' 'lib32-libxft' 'lib32-libxmu' 'lib32-libjpeg-turbo')
source=("http://mirrors.kernel.org/archlinux/community/os/i686/${pkgname/lib32-/}-${pkgver}-${_pkgrel32}-i686.pkg.tar.xz")
sha256sums=('05d0baa8c77eee1dde1cbf59626211d675515d2f570850e94f2d6238e30af525')

package()
{
  install -d "${pkgdir}/usr/lib32"
  cp -dpR --no-preserve=ownership "${srcdir}"/usr/lib/* "${pkgdir}/usr/lib32"
}
