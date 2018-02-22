# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=league-spartan
pkgname=ttf-${_fnt_name}
pkgver=20160215
pkgrel=3
pkgdesc="A new classic, this is a bold, modern, geometric sans-serif font that has no problem kicking its enemies in the chest."
arch=('any')
url="https://www.theleagueofmoveabletype.com/${_fnt_name}"
license=('custom:OFL')
groups=('lmt-fonts')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/league-spartan/archive/master.zip")
md5sums=('6eae098f805bfbb382077eaa84529748')

package() {
  install -Dm644 ${srcdir}/${_fnt_name}-master/LeagueSpartan-Bold.otf           ${pkgdir}/usr/share/fonts/OTF/LeagueSpartan-Bold.otf
  install -Dm644 ${srcdir}/${_fnt_name}-master/_webfonts/leaguespartan-bold.ttf ${pkgdir}/usr/share/fonts/TTF/LeagueSpartan-Bold.ttf

  install -Dm644 ${srcdir}/${_fnt_name}-master/ofl.markdown ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
