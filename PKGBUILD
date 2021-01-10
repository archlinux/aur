# Maintainer: fire100265 <fire100265@outlook.com>
# Maintainer: Erik Westrup <erik.westrup@gmail.com>
pkgname=snp
pkgver=8
pkgrel=1
pkgdesc='Wrap any shell command in a snapper pre-post snapshot, e.g. snp pacman -Syu.'
arch=(any)
source=("snp" "snp.install")
url='https://gist.github.com/erikw/5229436'
depends=("snapper")
install="snp.install"
sha256sums=('98cca5b7944578c01edc8b1ff21db91777ce4365ccef29a4818b0d72fa9c9eb9'
            '0cede1eb74104ad64b7ee3aa2cb254796a6def1b92db5e9d71194f06b8a67df2')

package() {
       install -Dm 755 snp $pkgdir/usr/bin/snp
}
