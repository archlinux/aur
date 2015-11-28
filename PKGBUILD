# Maintainer: Andrew Titmuss <andrewctitmuss@outlook.com>
pkgname=mcinstall
pkgver=1.0.3
pkgrel=1
pkgdesc="CLI Bash script to create a Minecraft server in one command"
arch=('x86_64')
url="https://github.com/iandrewt/mcinstall"
license=('GPL')
depends=('bash')
optdepends=('jre: if you want the server to use the already 
installed JRE instead of downloading one')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/iAndrewT/mcinstall/archive/$pkgver.tar.gz)
md5sums=('56A52A9E54C2BEC71230D573439E6933')

package() {
	cd MCInstall-$pkgver
	install -Dm755 "mcinstall" "$pkgdir/usr/bin/mcinstall"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
