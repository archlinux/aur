# Maintainer: Kevin Gravier<kevin@mrkmg.com>
pkgname=nativescript-sidekick
pkgver=1.15.0.v2019.1.18.17
pkgrel=1
pkgdesc="NativeScript Sidekick is a desktop GUI that enhances the power of the NativeScript CLI and simplifies the development of mobile applications. It is designed to be a companion that complements your code editor, source control, and any other tools you use."
arch=('x86_64')
url="https://www.nativescript.org"
license=('custom')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("$pkgname-$pkgver.deb::https://d2i32l9yp7bt0b.cloudfront.net/fusion/1.15.0-v.2019.1.18.17/linux/NativeScriptSidekick-amd64.deb")
sha512sums_x86_64=('9f98c3438ec32aa1a6232a59bd0f63ffbd17f102383e8eeb7afe49c724d251c11b0ce5c34c8dd7a65a3ac62104b54f1ac445d75ccf41edf84203911d76e67d84')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
