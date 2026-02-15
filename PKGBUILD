# Maintainer: Local User <user@localhost>
pkgname=dcat
pkgver=r71.bd333f9
pkgrel=1
pkgdesc="A terminal-based 3D model viewer using Vulkan"
arch=('x86_64')
url="https://github.com/Murat65536/dcat"
license=('Apache')
depends=('vulkan-icd-loader' 'assimp' 'cglm' 'libsixel')
options=('!debug')
install=dcat.install
source=("https://github.com/Murat65536/dcat/releases/download/v1.0.0/dcat-r71.bd333f9-1-x86_64.pkg.tar.zst")
sha256sums=('038c74a872a587b8ef0e350068c978bb0715edeefb57314160d8dc07ca2deec4')
noextract=('dcat-r71.bd333f9-1-x86_64.pkg.tar.zst')

package() {
	bsdtar --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO \
		-xpf "$srcdir/dcat-r71.bd333f9-1-x86_64.pkg.tar.zst" -C "$pkgdir"
}
