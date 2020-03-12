# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: samæ <samæ at marvid dot fr>

_fnt_name=league-script-number-one
pkgname=ttf-$_fnt_name
pkgver=20160215
_sha=225add0b37cf8268759ba4572e02630d9fb54ecf
pkgrel=3
pkgdesc='A script font between a girl’s love notes and handwritten letters from the ’21s'
arch=('any')
url="https://www.theleagueofmoveabletype.com/${_fnt_name%-number-one}"
license=('OFL')
groups=('lmt-fonts')
provides=("${pkgname%-number-one}")
source=("https://github.com/theleagueof/$_fnt_name/archive/$_sha.zip")
sha256sums=('44fbe4de63d64e5bb97c8872e197cc8138e681a1bdbbc66fdf0cde17ccd6369e')

package() {
    cd "$_fnt_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" webfonts/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" Open\ Font\ License*.markdown
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" readme.markdown
}
