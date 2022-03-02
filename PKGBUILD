# Maintainer: LordMZTE <lord@mzte.de>
pkgname=skim-fzf-dropin
pkgver=1.1
pkgrel=1
pkgdesc="A dropin fzf replacement using skim"
arch=('any')
license=('GPL')
depends=('bash' 'skim')
provides=('fzf')
conflicts=('fzf')
source=("fzf" "fzf-tmux")
sha256sums=('768768f7973499ca0c5f006434a222c3da782b8ca37e571843b1b7cb6e260e33'
            '7ca86ae0e007abdaa1b8a7954fd6d303f991aea2f0033612b16623111bb76833')

package() {
    install -Dm755 fzf "${pkgdir}/usr/bin/fzf"
    install -Dm755 fzf-tmux "${pkgdir}/usr/bin/fzf-tmux"
}
