# Maintainer: zzjzxq33 <wojiushixxx at 126 dot com>
pkgname=bbg
_pkgname=BBG
pkgver=20211022
pkgrel=3
epoch=
pkgdesc="A static blog generator built with electron"
arch=("x86_64")
url="https://github.com/baiyang-lzy/bbg"
license=('GPL')
groups=()
depends=('nss' 'gtk3')
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
	"bbg.desktop"
	"bbg.7z"::"https://github.com/baiyang-lzy/bbg/releases/download/${pkgver}/bbg_linux_${pkgver}.7z"
    )
noextract=()
sha256sums=(
	    'b9262d5c2b8aa65c2fade47436ebd7ea11078dc40e67216c2ea668c2a57d8668'
            'd88add9b6682730a650c35f6d228653d8778db506ac2943f760a92fb10d81070')
validpgpkeys=()

package(){
	mkdir -p ${pkgdir}/usr/bin
	install -Dm 644 ${srcdir}/bbg-linux-x64/bbg ${pkgdir}/usr/bin/bbg
	install -Dm 644 ${srcdir}/bbg.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm 644 ${srcdir}/bbg-linux-x64/resources/app/icons/icon.png ${pkgdir}/usr/share/icons/${pkgname}.png
}
