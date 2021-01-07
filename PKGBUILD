# Maintainer: fire100265 <fire100265@outlook.com>
# Maintainer: Erik Westrup <erik.westrup@gmail.com>
pkgname=snp
pkgver=8
pkgrel=1
pkgdesc='Wrap any shell command in a snapper pre-post snapshot, e.g. snp pacman -Syu.'
arch=(any)
source=("snp" "snp.install")
url='https://gist.github.com/erikw/5229436'
depends=(snapper)
install="snp.install"

package() {
       install -Dm 755 $source $pkgdir/usr/bin/snp
}
md5sums=('dab60c8e39ca9fcf0c2d92a037ca344b')
