# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=icd
pkgver=0.1.1
pkgrel=1
pkgdesc='Powerful `cd` command with fuzzy-search tool.'

arch=('any')
url="https://github.com/g-plane/$pkgname"
source=("https://github.com/g-plane/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3691ad0215e4f2d2f9a0b3080b7be7dee9d8e694412b1decf2ed2eca9786fb0d')
license=('MIT')
depends=('zsh')
optdepends=('fzy' 'fzf' 'ripgrep' 'grep')

package() {
    cd $srcdir/$pkgname-$pkgver/
    mkdir -p $pkgdir/usr/share/zsh/scripts/$pkgname/
    cp $pkgname.plugin.zsh $pkgdir/usr/share/zsh/scripts/$pkgname/

    mkdir -p $pkgdir/usr/share/licenses/$pkgname/
    cp ./LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
