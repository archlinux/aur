# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: garion < garion at mailoo dot org >
# Contributor: uastasi <uastasi at archlinux dot us>

pkgname="filezilla-faenza-icons"
pkgver=0.1
pkgrel=5
pkgdesc="Faenza icon theme for Filezilla."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/?content=135869"
license=('GPL')
depends=(filezilla)
source=("http://gnome-look.org/CONTENT/content-files/135869-faenza.tar.gz")
sha256sums=('87729d6deb94f5e69878a364c179c72782e218ba2855899cdb755e7d0fd53e43')

package() {
	mkdir -p ${pkgdir}/usr/share/filezilla/resources/faenza/
	cp -R ${srcdir}/faenza ${pkgdir}/usr/share/filezilla/resources/
}

# vim:set ts=4 sw=2 ft=sh et:
