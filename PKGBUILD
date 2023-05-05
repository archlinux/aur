# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Asuka Minato <youremail@domain.com>
pkgname=killport-bin
pkgver=0.7.0
pkgrel=1
epoch=
pkgdesc="A command-line tool to easily kill processes running on a specified port."
arch=(aarch64 x86_64 i686 armv7h)
url="https://github.com/jkfran/killport"
license=('MIT')
groups=()
depends=(glibc gcc-libs)
makedepends=()
checkdepends=()
optdepends=()
provides=(killport)
conflicts=(killport)
replaces=()
backup=()
options=()
install=
changelog=
source=(https://raw.githubusercontent.com/jkfran/killport/70e94827b03f957f799e47af40135ccfd1d97616/LICENSE)
source_aarch64=("https://github.com/jkfran/killport/releases/download/v$pkgver/killport-aarch64-linux-gnu.tar.gz")
source_x86_64=("https://github.com/jkfran/killport/releases/download/v$pkgver/killport-x86_64-linux-gnu.tar.gz")
source_i686=("https://github.com/jkfran/killport/releases/download/v$pkgver/killport-i686-linux-gnu.tar.gz")
source_armv7h=("https://github.com/jkfran/killport/releases/download/v$pkgver/killport-armv7-linux-gnueabihf.tar.gz")
noextract=()
sha256sums=('e023af3d4e0c544d684777de83d21f029df35a8bd60bf93dce2e703334095bf7')
sha256sums_aarch64=('647cad8f699d4303885ad288d444d55b644cc953ae7fdc3190de948725862749')
sha256sums_x86_64=('f1d1833d9fa0df1d6056473e5632dd158d42aee4531bee93866cfca4a0e09c23')
sha256sums_i686=('97e26d81500648cf5f2380c607f7b66d766ba82db8ed2dec8f2ec0ad537293b7')
sha256sums_armv7h=('af2651d7432104ced0ff0a188493929bd011b51b002ee79169ca66e49158ef5a')
validpgpkeys=()

package() {
	install -Dm755 killport* -t $pkgdir/usr/bin/
	install -Dm644 LICENSE* -t $pkgdir/usr/share/licenses/$pkgname/
}
