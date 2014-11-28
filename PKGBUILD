# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: simo91 <simo91.linux@gmail.com>

pkgname=debian-gdm-themes
pkgver=0.6.1
pkgrel=1
pkgdesc="Themes for the GNOME Display Manager"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/gdm-themes"
license=('GPL2')
depends=('gdm')
source=(http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gdm-themes/gdm-themes_${pkgver}.tar.gz)
md5sums=('111f67620355c34f4005fdd3dc76bf1d')

package() {
  cd ${srcdir}/gdm-themes-${pkgver}
  install -d ${pkgdir}/usr/share/gdm/themes
  mv */ ${pkgdir}/usr/share/gdm/themes
}
