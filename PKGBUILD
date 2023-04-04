# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=clashctl-bin
pkgver=0.3.3
pkgrel=1
epoch=
pkgdesc="CLI for interacting with clash"
arch=(x86_64)
url="https://github.com/George-Miao/clashctl"
license=('MIT')
groups=()
depends=(gcc-libs glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=(clashctl)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/George-Miao/clashctl/releases/download/0.3.3/clashctl-Linux"
"https://raw.githubusercontent.com/George-Miao/clashctl/0.3.3/LICENSE")
noextract=()
sha256sums=('628dbaa85d178967227c9af06de45c97f6be02caebb99b4d69a9a2edc5e635c6'
            '4a3a27267134942a753ba749a89027b628f73965c2f6e354bde7eff120c34319')
validpgpkeys=()

package() {
	install -Dm755 clashctl-Linux $pkgdir/usr/bin/clashctl
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
