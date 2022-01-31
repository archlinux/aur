# Maintainer: zzjzxq33 <wojiushixxx at 126 dot com>
pkgname=bbg
_pkgname=BBG
pkgver=20220123
pkgrel=3
epoch=
pkgdesc="A static blog generator built with electron"
arch=("x86_64")
url="https://github.com/baiyang-lzy/bbg"
license=('GPL')
groups=()
depends=('gtk3' 'libxcb' 'electron')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"bbg"
	"icon.png"
	"bbg.desktop"
	"app.asar"::"https://github.com/baiyang-lzy/bbg/releases/download/${pkgver}/app.asar"
    )
noextract=()
sha256sums=(
			'9bb48fe10ec7b1b669546d185a98976b822b50fbcbaf0dd5faf0c162e8346a21'
			'b2055c02386eacb33fff9f53b2c1bf099d49e4c63d016704a220e9108ded262f'
	    'd57c7e1126b2b168f2dd6debd2e77f069379c244b0ed7393eebffc2f2aa0d8be'
      '30bf1e3d230357cdf9ca0bbc97042cd7e231e5cf779d0b44fa28119bc4309a41')
validpgpkeys=()

package(){
	mkdir -p ${pkgdir}/usr/lib/${pkgname}/
	cd ${srcdir}/
	install -Dm 644 app.asar ${pkgdir}/usr/lib/${pkgname}/app.asar
	install -Dm 775 ${srcdir}/bbg ${pkgdir}/usr/bin/${pkgname}
	install -Dm 644 ${srcdir}/bbg.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm 644 ${srcdir}/icon.png ${pkgdir}/usr/share/icons/${pkgname}.png
}
