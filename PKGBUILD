# Maintainer: Daniel Hnyk <kotrfa [at] gmail [dot] com>

pkgname=biber-bin
pkgver=2.6 # for biblatex 3.5
pkgrel=1
pkgdesc="Binary version of a unicode-capable BibTeX replacement for biblatex users"
arch=('x86_64')
license=('PerlArtistic' 'GPL')
url="https://sourceforge.net/projects/biblatex-biber/"

source_x86_64=("biber::https://www.dropbox.com/s/aa8aimnyi51wh8q/biber?raw=1")
md5sums_x86_64=('995dd26c6f22c554a79a2a345b51a41b')


package() {
    install -Dm755 biber "${pkgdir}/usr/bin/biber"
}

