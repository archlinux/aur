# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ttf-bazin-proposed-punctuation
_fname=Bazin
pkgver=1
pkgrel=5
pkgdesc='proposed, non-canonical punctuation marks from Hervé Bazin'
arch=('any')
url='http://jonathanzong.github.io/proposed-punctuation/'
license=('OFL')
source=("https://github.com/jonathanzong/proposed-punctuation/raw/gh-pages/assets/$_fname.ttf"
        "https://github.com/jonathanzong/proposed-punctuation/raw/gh-pages/LICENSE")
sha256sums=('f7880d91b2698a7646f87fc46ce9c549eebf3d78ab5cbceb570bd1c0c20e37b6'
            '91cd0038b43e170b6ffda211447b4bb5aae1d5e794eacaca460a9bb8cb75753c')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" "$_fname.ttf"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
