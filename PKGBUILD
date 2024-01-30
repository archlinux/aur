# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: garion < garion at mailoo dot org >
# Contributor: uastasi <uastasi at archlinux dot us>
#
pkgname="filezilla-faenza-icons"
pkgver=0.1
pkgrel=7
pkgdesc="Faenza icon theme for Filezilla."
arch=('i686' 'x86_64')
url="http://tiheum.deviantart.com/art/Faenza-Icons-173323228"
license=('GPL')
depends=('filezilla')
source=("faenza.tar.xz" "faenza-dark.tar.xz")
sha256sums=('9c969b59b8a99297ad14cfc87264ef27e5dc26ee74b0f12e851bbc72dc048f82'
            '3be2dbf6bae47cde3cd77d1e0b6c73023a0c643e8a066efb7528d2bb94c43f4e')

package() {
	mkdir -p ${pkgdir}/usr/share/filezilla/resources/{faenza,faenza-dark}
	cp -R ${srcdir}/{faenza,faenza-dark} ${pkgdir}/usr/share/filezilla/resources/
}

# vim:set ts=4 sw=2 et syn=sh ft=sh:
