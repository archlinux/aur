# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fnt_name=league-mono
pkgname=ttf-$_fnt_name
pkgver=20171115
_sha=3536b38d1baee171787ba0fe6194a13e18e540bd
pkgrel=2
pkgdesc="a monospace typeface inspired by Fira Mono, Libertinus Mono, and Courier"
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('cbb244ea4dcab23c5c810b62b51bb095b444738d7590cd44d2192867f005e4bd')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ofl*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
