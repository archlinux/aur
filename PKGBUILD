# Maintainer: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=20.11.1
pkgrel=1
url='https://github.com/teejee2008/timeshift'
arch=('x86_64' 'aarch64' 'i386')
license=(GPL)
source_x86_64=(https://github.com/teejee2008/timeshift/releases/download/v$pkgver/timeshift_${pkgver}_amd64.deb)
source_aarch64=(https://github.com/teejee2008/timeshift/releases/download/v$pkgver/timeshift_${pkgver}_arm64.deb)
source_i386=(https://github.com/teejee2008/timeshift/releases/download/v$pkgver/timeshift_${pkgver}_i386.deb)
pkgdesc='A backup and restore utility'
depends=('libgee' 'vte3' 'cronie' 'cairo' 'rsync' 'btrfs-progs' 'json-glib' 'gdk-pixbuf2' 'gtk3')
md5sums=('c71ca96e3be09f471c4e8c93cbbbc885')
conflicts=(timeshift)
provides=(timeshift)

package() {
       tar -xvf data.tar.xz -C $pkgdir
}
