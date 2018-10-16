# Maintainer: Konstantin Gorodinskiy<mail@konstantin.io>
pkgname=nativescript-sidekick
pkgver=1.13.0.v2018.10.5.2
pkgrel=1
pkgdesc="NativeScript Sidekick is a desktop GUI that enhances the power of the NativeScript CLI and simplifies the development of mobile applications. It is designed to be a companion that complements your code editor, source control, and any other tools you use."
arch=('x86_64')
url="https://www.nativescript.org"
license=('custom')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("$pkgname-$pkgver.deb::https://d2i32l9yp7bt0b.cloudfront.net/fusion/1.13.0-v.2018.10.5.2/linux/NativeScriptSidekick-amd64.deb")
sha512sums_x86_64=('a6cda05c47e3f2828e0afbccf8ff106e1a1721554ee194c2255d7384182d91e6d56eafbabdd6fccd513078f5e0a1443dd051b0fca903e6f06e02902010fa69bd')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
