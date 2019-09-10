# Maintainer: Kevin Gravier<kevin@mrkmg.com>
pkgname=nativescript-sidekick
pkgver=1.19.1.v.2019.8.1.2
pkgrel=1
pkgdesc="NativeScript Sidekick is a desktop GUI that enhances the power of the NativeScript CLI and simplifies the development of mobile applications. It is designed to be a companion that complements your code editor, source control, and any other tools you use."
arch=('x86_64')
url="https://www.nativescript.org"
license=('custom')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("$pkgname-$pkgver.deb::https://sk-cdn.nativescript.cloud/fusion/1.19.1-v.2019.8.1.2/linux/NativeScriptSidekick__amd64.deb")
sha512sums_x86_64=('44f0880b475efd84adec246dbf72c4f4a8ce2b623c63ad97c7734809649e37b335cd556722c3aaacdc278ac1b734361a38ac2b9d279afb65fe050df60eddecf8')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
