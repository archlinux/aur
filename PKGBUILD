# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Firmicus <francois.archlinux.org>

pkgname=ttf-freebanglafont
pkgver=20130212
pkgrel=5
pkgdesc='Bengali fonts'
url='https://www.ekushey.org/'
license=('GPL')
arch=('any')
source=("https://sources.archlinux.org/other/packages/${pkgname}/ttf-freebanglafont-20130212-2.src.tar.gz")
b2sums=('a20699d72c7a6886b1cdad65f6dcffac279c74085005b2e53248fbc44058dc9aef4d04ea8a581202811a2dfbf9fadc31e49def97962b6e37a096dde5049f13d0')

package() {
  install -Dm644 -t "${pkgdir}"/usr/share/fonts/TTF/ ttf-freebanglafont/*.ttf
}
