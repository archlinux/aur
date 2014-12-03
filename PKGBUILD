# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: simo91 <simo91.linux@gmail.com>

pkgname=debian-gdm-themes
pkgver=0.6.2
pkgrel=1
pkgdesc="Themes for the GNOME Display Manager"
arch=('any')
url="https://packages.debian.org/squeeze/gnome/gdm-themes"
license=('GPL2')
depends=('gdm')
source=(http://ftp.de.debian.org/debian/pool/main/g/gdm-themes/gdm-themes_${pkgver}.tar.gz)
md5sums=('37ae0fb8d9f1e92ba5c320640f270e8d')

package() {
  cd "${srcdir}"/gdm-themes-$pkgver

  install -d "${pkgdir}"/usr/share/gdm/themes
  mv */ "${pkgdir}"/usr/share/gdm/themes
}
