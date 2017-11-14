# Maintainer: Konstantin Gorodinskiy<mail@konstantin.io>
pkgname=nativescript-sidekick
pkgver=1.0.0.v.2017.11.6.3
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
sha512sums_x86_64=('76b4dad22486a7e639ffd3ed7d4f896c96a5f171486b219d626a45f0344208a479dcb33451a9db240f94e86fb3113a4404ea65dc01807a4028d2d93ff78262d8')

package(){
	tar xf data.tar.xz -C "${pkgdir}"

	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
