# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>
# Contributor: F Carpano < gmail-com: daert781 >
# Contributor: Anthony Samartsev <kycok@archlinux.info>

pkgname=xcursor-osx-elcap
pkgver=1.00
pkgrel=4
pkgdesc="Cursor theme from OSX"
arch=('any')
url="https://www.gnome-look.org/p/1084939/"
license=('GPL')
source=('https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1MTUzMDg3MzUiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6Ijg4MWZkNDU5NzQwNTI4NmE4OTBmMjVhNmNlYmFkMTlmYjI4ZmQ3NjM0NjZmMDRiNWY1ZTViM2M3Njk1ZTAwZDhkYjU0MTY1N2QxOWUzOTU2YmY1ZDUxZjBhMTM1ZTM4YWExZmMwNjNiNjQzOWZlZTU3OWU1ODg4NGUyMjI1YjlmIiwidCI6MTU5Njk5NTczOSwic3RmcCI6ImUxNDdlZGQ4YTliZWE4NmMyYTlmNjM5MjYyYjY2NjM1Iiwic3RpcCI6Ijg4LjEwMi42OC4xNzEifQ.uHfffxOp2MZF1RGX1E8Kf_h_T8RgcvU6H3AuUXaLtM8/OSX-ElCap-(KDE).R2.tar.bz2')
sha512sums=('7db6bc6266fc99358e35d203b767ffb9a6883bad40d8f4332f85214609859583c29e637a339cc1f386e581bc43cd9365088cc277c8ee1493c49d03f17ec45695')

build() {
	true
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r 'OSX-ElCap-(KDE)/OSX-ElCap' $pkgdir/usr/share/icons
}
