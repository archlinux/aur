# Maintainer: dmitry.romanov <dmitry.romanov85@gmail.com>
# Maintainer: Michael Herrmann <michael+removethisifyouarehuman@herrmann.io>

pkgname=fman
pkgver=0.9.5
pkgrel=1
pkgdesc="A modern file manager for power users. Beautiful, fast and extensible"
arch=('x86_64')
url="https://fman.io"
license=('custom')
depends=('qt5-base' 'p7zip')
optdepends=('qt5-svg')

source=('https://fman.io/updates/arch/fman-0.9.5.pkg.tar.xz')
noextract=("${source[@]##*/}")

sha256sums=('b14464a512c11b8d4fa36168693ea5b3a876c2b76b64fbba48425ec7bfcb4752')

package() {
	tar xf "${srcdir}/fman-0.9.5.pkg.tar.xz" -C "${pkgdir}" --exclude='.INSTALL' --exclude='.PKGINFO' --exclude='.MTREE'
}
