# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: foxbunny <bg.branko@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=adobe-icc
pkgver=CS4
pkgrel=3
pkgdesc='Adobe ICC profiles'
arch=('any')
url='http://www.adobe.com/support/downloads/iccprofiles/iccprofiles_mac.html'
license=('custom')
makedepends=('unzip')
source=('http://download.adobe.com/pub/adobe/iccprofiles/mac/AdobeICCProfilesCS4Mac_end-user.zip'
        LICENSE)
sha512sums=('cbcb6c4c94d139ffcd901fc5ebdc797ce84b46f1227aba3723aa303089552d57aab78bc30cc0f57a32eee1beb04a55a953574920517dd018fcf992fa063f2296'
            '134bfaf9bec754be7137f1c4da1721eda7120c8d1a0ba62093f02b5fe82b0dc23bb4ed04d8eb562236eaa333629714c2fddb3309081dc0a3a2b24f770fd5664c')

package() {
	install -d "${pkgdir}"/usr/share/{color/icc,doc/adobe-icc,licenses/adobe-icc}
	install -m644 */*/*.icc "${pkgdir}"/usr/share/color/icc
	install -m644 */*.pdf "${pkgdir}"/usr/share/doc/adobe-icc
	install -m644 LICENSE "${pkgdir}"/usr/share/licenses/adobe-icc
}
