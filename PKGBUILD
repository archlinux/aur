# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=hyperleda-galaxy-db-astap
pkgver=2019.5.3
pkgrel=1
pkgdesc="Massive database of galaxies and other non-star objects, for use with ASTAP"
arch=('any')
url="http://leda.univ-lyon1.fr/"
license=('LGPL3')
source=("hyperleda.deb::https://sourceforge.net/projects/astap-program/files/star_databases/hyperleda.deb/download")
sha256sums=('98ab5a23a468addce87f3fc534a67f8b53d64388af0e1ed162b22f3765f27758')
depends=('astap')

# the deb is automatically unpacked in the automatic prepare() step, but the files we want are doubly archived
package() {
    tar xpfv data.tar.xz -C "${pkgdir}"
}

