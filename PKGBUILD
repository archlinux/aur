# Maintainer: Kookies <kookies@tutamail.com>
_name=wiiu-vc-extractor
pkgname=$_name-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Extracts Wii U Virtual Console roms from dumps created via DDD or dumped from the SNES Mini (release)"
arch=(x86_64)
url="https://github.com/wheatevo/$_name"
license=('GPL3')
provides=($_name)
conflicts=($_name)
options=(!strip)
source=("$url/releases/download/$pkgver/wiiu-vc-extractor-linux-x64.zip")
md5sums=('80ef1279d11f06bee5d87faeea47a334')

package() {
	install -Dm755 wiiuvcextractor -t "$pkgdir/usr/bin/"	
}
