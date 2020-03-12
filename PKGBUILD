# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=orbitron
pkgname=ttf-$_fnt_name
pkgver=20160215
# 20110426
_sha=13e6a5222aa6818d81c9acd27edd701a2d744152
pkgrel=3
pkgdesc="A geometric sans-serif font from the future"
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('770d923c2d84204ca75b9831f767b463ac618c93f168c6d136d63f5a4ac247c1')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
