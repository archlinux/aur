# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: foxbunny <bg.branko@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=icc-adobe
pkgver=CS4
pkgrel=1
pkgdesc='Adobe ICC profiles'
arch=('any')
url='https://www.adobe.com/support/downloads/iccprofiles/iccprofiles_mac.html'
license=('custom')
makedepends=('unzip')
provides=('adobe-icc')
conflicts=('adobe-icc')
source=('https://download.adobe.com/pub/adobe/iccprofiles/mac/AdobeICCProfilesCS4Mac_end-user.zip'
        LICENSE)
b2sums=('4cb7c3250dae3e2029ea29770d7587ab39fa0d4b51ce72fe21b6d30d20c42ef5ecabb251c259fcac0b8940158d44a47125cb2c307d7ab5c4f2c802a430d3718e'
        'bf812341e43d4c1075869ff212163d00baf0b9f608136f5626363ccd7fed4bba10875e15510d382a6065e10283e16a9e4ffcf3f01d85f6d088883722615e41bf')

package() {
	install -D -m644 -t "${pkgdir}"/usr/share/color/icc */*/*.icc
	install -D -m644 -t "${pkgdir}"/usr/share/doc/icc-adobe */*.pdf
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/icc-adobe
}
