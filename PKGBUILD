# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=edid_disable_exts
pkgver=1.2
pkgrel=4
pkgdesc="Modifies a binary EDID file and disables EDID extensions and updates the checksum"
arch=('i686' 'x86_64')
url="http://analogbit.com/software/edid_disable_exts"
license=('GPL')
depends=()
source=("http://analogbit.com/files/edid_disable_exts_v$pkgver.tgz")
md5sums=('1607c4e1f5351edc89d35d844adb749e')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dvm755 'edid_disable_exts' "$pkgdir/usr/bin/edid_disable_exts"
}
