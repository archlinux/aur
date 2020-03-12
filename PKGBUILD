# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=goudy-bookletter-1911
pkgname=ttf-$_fnt_name
pkgver=20160215
# 20110426
_sha=85ff5b834b4f63feb36fd2053949c19660580e48
pkgrel=4
pkgdesc='A public domain font based on Frederic Goudy’s Kennerley Oldstyle'
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('4731a4945c6ce9e69d749902c7659142187594d5a8bec6025bdfbc3600d0e019')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" webfonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
