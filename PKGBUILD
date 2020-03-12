# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=league-spartan
pkgname=ttf-$_fnt_name
pkgver=20160215
# 20140922
_sha=c350408b07ca284b6c097b7194f2f14f428013f5
pkgrel=4
pkgdesc="A geometric sans-serif revival of ATF's classic Spartan"
arch=('any')
url="https://www.theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/league-spartan/archive/$_sha.zip")
sha256sums=('ddac4b049281424adfefec1cc7b2bca3e1f64897cb4edc421f6b2c217aa3c141')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" _webfonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
