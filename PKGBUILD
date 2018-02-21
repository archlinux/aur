# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=league-script-number-one
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=2
pkgdesc='A coquettish script font somewhere between a high school girl’s love notes and handwritten letters from the ’20s'
arch=('any')
url="http://theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/theleagueof/${_fnt_name}/archive/master.zip")
sha256sums=('fd28ca03e64c85c210fa3f9f729912080ed75b3f12c37228c2ae679109597398')

package() {
    cd ${_fnt_name}-master

    install -d ${pkgdir}/usr/share/fonts/OTF

    install -Dm644 Open\ Font\ License.markdown ${pkgdir}/usr/share/licenses/${pkgname}/LICENSCE
    install -Dm644 *.otf  ${pkgdir}/usr/share/fonts/OTF/
}
