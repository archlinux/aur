# Maintainer: Tor Vic <torvic9 AT mailbox DOT org>

pkgname='mini-benchmarker'
pkgver=2.3
pkgrel=1
pkgdesc='A simple benchmarking script using stress-ng, perf, blender etc.'
url="https://gitlab.com/torvic9/mini-benchmarker"
arch=('x86_64')
licence=('GPL3')
depends=('gcc' 'make' 'cmake' 'time' 'perf' 'unzip' 'bc' 'stress-ng'
	 'nasm' 'inxi' 'argon2' 'wget' 'x265' 'xz' 'blender'
	 'zlib' 'libdrm' 'git' 'python' 'primesieve' 'p7zip')
source=(git+https://gitlab.com/torvic9/mini-benchmarker.git?signed#tag=v${pkgver})
sha512sums=('SKIP')
validpgpkeys=('4671AD7FB662DF5397303D3E639389191B4D896A') # torvic9

package() {
	cd $pkgname
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
}
