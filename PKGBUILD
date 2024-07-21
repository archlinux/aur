# Maintainer: omansh-krishn <omanshkrishn@duck.com>

pkgname=crave
pkgver=0.2.7023
_pkgver=0.2-7023
pkgrel=1
pkgdesc="Crave CLI - Binary Version"
arch=('aarch64' 'x86_64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( glibc libxcrypt-compat openssh rsync zlib )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source_aarch64=( crave::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-aarch64.bin )
source_x86_64=( crave::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )

sha256sums_aarch64=( 088977d360bad758cfdc9ce9ee32010edf90d693a0efdaf127b1914ec9512a5e )
sha256sums_x86_64=( 873e4893bc2d4837fdfbc3cbacaed4d825a61a130eeafb503103a2c170db4505 )

package() {

	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/crave" "$pkgdir/usr/bin/crave"

}
