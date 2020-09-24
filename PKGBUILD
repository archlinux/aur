# Maintainer: Pig Fang <g-plane@hotmail.com>
pkgname=icd
pkgver=0.1.1
pkgrel=2
pkgdesc='Powerful `cd` command with fuzzy-search tool.'

arch=('any')
url="https://github.com/g-plane/$pkgname"
source=("https://github.com/g-plane/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4ad64ebd0afcb99f8def17044d2255c34fd3bdf16683ff938829b64a1048fdf2')
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
