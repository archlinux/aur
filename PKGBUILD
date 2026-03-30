# Maintainer: gardenapple <mailbox at appl garden>

pkgname=didder-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='An extensive, fast, and accurate command-line image dithering tool. (binary release)'
url='https://github.com/makew0rld/didder'
arch=('x86_64' 'pentium4' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=()
makedepends=()
source=("didder_${pkgver}.1::https://github.com/makew0rld/didder/raw/refs/tags/v${pkgver}/didder.1")
_source_base="https://github.com/makew0rld/didder/releases/download/v${pkgver}/didder_${pkgver}_linux"
source_x86_64=(  "${_source_base}_64-bit")
source_pentium4=("${_source_base}_32-bit")
source_armv7h=(  "${_source_base}_armv7")
source_aarch64=( "${_source_base}_arm64")
sha512sums=('9146e633b22cb1c567b512cf3874e4da0fdcbd4f194b580689bf38de637a418d26daa615ac559c26e3d7b3ab0a94f7a534aef3a084a86a8300ef3103fd9b070f')
sha512sums_x86_64=('01dbd50dbe7ac1c1eed495a13366946a122597e3f7ca12191c0cfd14916ae95600cc6e50cc0c9cf77576cc95366061a7a25890049ae51a267ea1ea98b487d72f')
sha512sums_pentium4=('8ad17aeca583595a9327f73bceedecff7dbb1e7818727cf838971528c5f6e966edf2f3f018e23868e46efc0ec1ac3c85309f63b71293c890ceaeef1fbcca14dc')
sha512sums_armv7h=('854b6a6a0572a21302d7c26aa9534e85b7fff640a0330b6b273b4bdc8d9955d01ad1fde3697fc1ce4a694918e6fcfd72fe54f6eea9b6f43d3f9a153c9dd0a3f1')
sha512sums_aarch64=('b2d8757c075143691f1e816a935fa160e4f2e83883b8dd5a9c18f3e85fd5970291ff4ad8bdb34211d6d589d41b979872db23cfbce7c09b1dba0676c9d86c1c7e')

package() {
	install -Dm755 -T didder_${pkgver}_linux_* "$pkgdir/usr/bin/didder"
	install -Dm644 -T didder_${pkgver}.1 "$pkgdir/usr/share/man/man1/didder.1"
}
