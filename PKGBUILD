# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Asuka Minato <youremail@domain.com>
pkgname=killport-bin
pkgver=0.8.0
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
sha256sums_aarch64=('713d5b9b38f74785022bb5f1b6e0eb5dbc0c58d29b64d965cd2a2d7692ded9e4')
sha256sums_x86_64=('5d5b51673546eebd97279b1c530f8fa0d8319e5f3f29fcb2d1303ad28ac13b7c')
sha256sums_i686=('164001abb985dc1e656f74966dd4946bda04b741890538c4b1ad7fa611d6cf37')
sha256sums_armv7h=('1bc81aab939b781f1cee25caa452ec5c9cbc5abd6f595366229971f16644ebeb')
validpgpkeys=()

package() {
	install -Dm755 killport* -t $pkgdir/usr/bin/
	install -Dm644 LICENSE* -t $pkgdir/usr/share/licenses/$pkgname/
}
