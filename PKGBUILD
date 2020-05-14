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
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1NzEwNTk5MDQiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjMwYzkxOWQzNzc1ZmNmZDQ3MTcwMDBkZGIwZDIzYjk2ZjMwN2NhOWQzZjVmNDhmYjk5ZTZkOGJkNTZlZDE4NDI5NmU4NDM1ODRlNDQ2MzZlOWE4OWY3ODNlYjY5MDBmZjFkM2M2Y2FmNmZlN2RmNGMyZTdiNTkzMzQ4OTZjYTY0IiwidCI6MTU4OTUwMDU1MSwic3RmcCI6ImYxNGY3YzI3MmQzY2M5MTVjOTg0OTNiMWU0NDYzOTZmIiwic3RpcCI6IjE4OS4xMTQuMTU4LjM2In0.oZ70642tVRWoHN_YUDdanm6AAfmUaYzg81M8dhvgRIw/${pkgname}-${pkgver}.tar.gz")
md5sums=('3da7ec024552fcde87380d9a5014f308')

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/"
        cp -rfv "$srcdir/${_pkgname}" "${pkgdir}/usr/share/plasma/plasmoids/"
}

