# Maintainer: LordMZTE <lord@mzte.de>
pkgname=skim-fzf-dropin
pkgver=1.2
pkgrel=1
pkgdesc="A dropin fzf replacement using skim"
arch=('any')
license=('GPL')
depends=('skim')
provides=('fzf')
conflicts=('fzf')
source=("fzf" "fzf-tmux")
sha256sums=('17067d15d3a96543bcba2269e708414c5573c388de9721ecf07d0c2b35a8d3be'
            '4997c6a699425d891063dd6761eea91429fe42a132a6a677e67861593e2945a3')

package() {
    install -Dm755 fzf "${pkgdir}/usr/bin/fzf"
    install -Dm755 fzf-tmux "${pkgdir}/usr/bin/fzf-tmux"
}
