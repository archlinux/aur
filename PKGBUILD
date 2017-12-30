# Maintainer: Konstantin Gorodinskiy<mail@konstantin.io>
pkgname=nativescript-sidekick
pkgver=1.1.0.v.2017.12.21.2
pkgrel=1
pkgdesc="NativeScript Sidekick is a desktop GUI that enhances the power of the NativeScript CLI and simplifies the development of mobile applications. It is designed to be a companion that complements your code editor, source control, and any other tools you use."
arch=('x86_64')
url="https://www.nativescript.org"
license=('custom')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://dg336yfo7k.execute-api.us-east-1.amazonaws.com/live/update/official/linux/NativeScriptSidekick-amd64.deb")
sha512sums_x86_64=('09d0841078f553551e4ec5b7599103fb7a93ee031818b9087db9398b27de5765ce7048159f5dd3cbf23e05bd4ef0585e94d619fb9e9f58bc2814ae282bd39639')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
