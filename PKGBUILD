# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=jigdo-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Distribute large images by sending and receiving the files that make them up - Debian package"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.einval.com/~steve/software/jigdo/"
license=('GPL2')
depends=('db' 'wget')
conflicts=('jigdo')
provides=('jigdo')

source_x86_64=("http://ftp.debian.org/debian/pool/main/j/jigdo/jigdo-file_${pkgver}-${pkgrel}_amd64.deb")
source_i686=("http://ftp.debian.org/debian/pool/main/j/jigdo/jigdo-file_${pkgver}-${pkgrel}_i386.deb")
source_arm=("http://ftp.debian.org/debian/pool/main/j/jigdo/jigdo-file_${pkgver}-${pkgrel}_armel.deb")
source_armv6h=("http://ftp.debian.org/debian/pool/main/j/jigdo/jigdo-file_${pkgver}-${pkgrel}_armel.deb")
source_armv7h=("http://ftp.debian.org/debian/pool/main/j/jigdo/jigdo-file_${pkgver}-${pkgrel}_armhf.deb")
source_aarch64=("http://ftp.debian.org/debian/pool/main/j/jigdo/jigdo-file_${pkgver}-${pkgrel}_arm64.deb")
sha256sums_x86_64=('c9f884bc37a71f19ba1b6c9acabff7dda7214e1228347b76edd10ff3d453aee7')
sha256sums_i686=('280cb562ca9fe4916c99d452fb8bcad56d7ec50cd39124bab01889a2d2ef0f95')
sha256sums_arm=('18d73ed4315269110481ed1a10de691d733233f1da9ea1e482c73517bccd3385')
sha256sums_armv6h=('18d73ed4315269110481ed1a10de691d733233f1da9ea1e482c73517bccd3385')
sha256sums_armv7h=('dc1369e3429c56c81bb1e57360f9944144c4abca2241c4f53a0578e3b2742afb')
sha256sums_aarch64=('0d42d458d6da02cd254d7cc6ba4624914f16e70fb2143e99109162a5e7a3b71d')

package() {
	bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
	rm -rf "$pkgdir"/usr/share/doc
	rm -rf "$pkgdir"/usr/share/doc-base
}
