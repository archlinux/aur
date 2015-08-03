# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=subrok
pkgver=1.7
pkgrel=1
pkgdesc="This script allows Amarok to play music from Subsonic servers."
url="http://kde-apps.org/content/show.php/SubRok?content=156122"
arch=('any')
license=('GPL')

depends=('amarok')

source=(http://kde-apps.org/CONTENT/content-files/156122-SubRok-${pkgver}.tar.gz)
md5sums=('ae2c9fac55c46624f1f7d7ab3c499042')
sha512sums=('7ee7060693313577d926c04a549ef5e3d4de804f7196a19b3867f2688c2f20056b5bcfb74dd7fa6cf8216215e6a90794eb75b8b835a409293f422b05954c9e37')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/apps/amarok/scripts"
  cp -r SubRok/ "${pkgdir}/usr/share/apps/amarok/scripts"
  chown root:root "${pkgdir}/usr/share/apps/amarok/scripts/SubRok"
}
