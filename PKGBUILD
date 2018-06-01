# Maintainer: Erik Dubois - erik.dubois@gmail.com

pkgname=oxy-neon
pkgver=0
pkgrel=2
pkgdesc="Stylized oxygen mouse theme created for use with dark desktop and especially for FRUiT's Neon suite. "
arch=('any')
url="https://www.gnome-look.org/p/999997/startdownload?file_id=1460735457&file_name=137109-oxy-neon-0.2.tar.gz&file_type=application/x-gzip&file_size=184907&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1460735457%2Fs%2Ffcd191d092d1d3fc465c900876a74ae1%2Ft%2F1527881882%2Fu%2F185426%2F137109-oxy-neon-0.2.tar.gz"
license=('GPL3')
source=("137109-${pkgname}-${pkgver}.${pkgrel}.tar.gz::https://www.gnome-look.org/p/999997/startdownload?file_id=1460735457&file_name=${pkgname}-${pkgver}.${pkgrel}.tar.gz&file_type=application/x-gzip&file_size=184907&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1460735457%2Fs%2Ffcd191d092d1d3fc465c900876a74ae1%2Ft%2F1527881882%2Fu%2F185426%2F137109-${pkgname}-${pkgver}.${pkgrel}.tar.gz")
md5sums=('c8dc8489fbb25935b84c7a4b1bfcc5e4')
sha256sums=('4ef320165c749d1f9953e852eb69d74f0bf3eb9bab728dc230fb7565570d5655')

package() {
	cd "$pkgname"
	install -dm755 "$pkgdir/usr/share/icons/oxy-neon"
	cp -r * "$pkgdir/usr/share/icons/oxy-neon"
}
