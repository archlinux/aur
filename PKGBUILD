# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=nitrokey-app2
pkgver=2.1.4
pkgrel=1
pkgdesc='Nitrokey management application for Nitrokey 3 devices'
arch=('x86_64')
url='https://github.com/Nitrokey/nitrokey-app2'
license=('Apache-2.0')
depends=('python-pynitrokey')
source=(
    "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/nitrokey-app-v$pkgver-x64-linux-binary.tar.gz"
    "$pkgname.svg::https://raw.githubusercontent.com/Nitrokey/nitrokey-app2/main/nitrokeyapp/ui/icons/nitrokey-app-icon-vector.svg"
)
sha256sums=('15fb4146a3e981694419c44f16bcef3d4fa893f44d9f7fc65554fa928c8a2b1a'
            'e49609f53b375f9eb69d7024699e403ad6913f40453bfe2bdf1bab362e78206e')

package() {
	install -Dv nitrokey-app-v$pkgver-x64-linux-binary "$pkgdir/usr/bin/$pkgname"
	install -Dv ../nitrokey-app2.desktop "$pkgdir/usr/share/applications/nitrokey-app2.desktop"
	install -Dv nitrokey-app2.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nitrokey-app2.svg"
}
