# Maintainer: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=20.11.1
pkgrel=1
url='https://github.com/teejee2008/timeshift'
arch=(x86_64)
license=(GPL)
source=(https://github.com/teejee2008/timeshift/releases/download/v$pkgver/timeshift_${pkgver}_amd64.deb)
pkgdesc='A backup and restore utility'
depends=('libgee' 'vte3' 'cronie' 'cairo' 'rsync' 'btrfs-progs' 'json-glib' 'gdk-pixbuf2' 'gtk3')
md5sums=('c71ca96e3be09f471c4e8c93cbbbc885')

package() {
       ar -xv ${pkgname}_${pkgver}_amd64.deb
       tar -xvf data.tar.xz -C $pkgdir
}
