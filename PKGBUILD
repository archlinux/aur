# Maintainer: LordMZTE <lord@mzte.de>
pkgname=skim-fzf-dropin
pkgver=1
pkgrel=1
pkgdesc="A dropin fzf replacement using skim"
arch=('any')
license=('GPL')
depends=('bash' 'skim')
provides=('fzf')
conflicts=('fzf')
source=("fzf" "fzf-tmux")
sha256sums=('bd114b61f031914ddfcb768498f23976701ddbf789e016048aef864f0b391154'
            'fab2692ebe57af2fb0a7a01ee3fa3d4cb59eccd4943d7299d6ffeaa3b7388e19')

package() {
    install -Dm755 fzf "${pkgdir}/usr/bin/fzf"
    install -Dm755 fzf-tmux "${pkgdir}/usr/bin/fzf-tmux"
}
