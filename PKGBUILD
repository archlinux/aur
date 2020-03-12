# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=ostrich-sans
pkgname=ttf-$_fnt_name
pkgver=20160215
# 20140418
_sha=a949d40d0576d12ba26e2a45e19c91fd0228c964
pkgrel=3
pkgdesc="A gorgeous modern sans-serif with a very long neck"
arch=('any')
url="http://theleagueofmoveabletype.com/$_fnt_name"
license=('OFL')
groups=('lmt-fonts')
source=("$pkgname-$pkgver.zip::https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('962953c33c87ae9c5d6de678b3bc416504a5b2df92c12fd0389d1f5092a9127c')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" webfonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
