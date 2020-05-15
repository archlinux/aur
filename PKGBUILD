# Maintainer: Young Acinonyx <young.acinonyx@gmail.com>

pkgname=plasma5-applets-plasmaconfsaver
_pkgname=com.pajuelo.plasmaConfSaver
pkgver=1.3
pkgrel=1
pkgdesc="Plasma 5 widget that allows you to save your current desktop layout configuration and restore previous saved layouts on the fly."
arch=('any')
url="https://store.kde.org/p/1298955/"
license=('GPL')
depends=('kdialog' 'konsole' 'plasma-workspace' 'scrot')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1NzEwNTk5MDQiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImMzODVhOTdjMDU1NWIyYjUyZjNkNzhkYzdjZWFmOTIwMTQ3ZDhjOTRkNjNhYzFjM2FkNzUyMmQ0ZGNkMmY4ZGQ5N2Y1YTg5YTVmYmFjZDNjZGU1MTY1NDY0NDg1YjQyYzkwNGFkOGM5ZTgxOGZmMjVjMmQwOGQ1NTg3NjJlMGNmIiwidCI6MTU4OTUwODQ1Niwic3RmcCI6ImYxNGY3YzI3MmQzY2M5MTVjOTg0OTNiMWU0NDYzOTZmIiwic3RpcCI6IjE4OS4xMTQuMTU4LjM2In0.grX00cgwlhKpR6X5Xmie1SInoH2YqRvMBs2xe5AHKzc/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3da7ec024552fcde87380d9a5014f308')

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/"
        cp -rfv "$srcdir/${_pkgname}" "${pkgdir}/usr/share/plasma/plasmoids/"
}

