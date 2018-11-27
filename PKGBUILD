# Maintainer: Konstantin Gorodinskiy<mail@konstantin.io>
pkgname=nativescript-sidekick
pkgver=1.14.1.v2018.11.23.3
pkgrel=1
pkgdesc="NativeScript Sidekick is a desktop GUI that enhances the power of the NativeScript CLI and simplifies the development of mobile applications. It is designed to be a companion that complements your code editor, source control, and any other tools you use."
arch=('x86_64')
url="https://www.nativescript.org"
license=('custom')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("$pkgname-$pkgver.deb::https://d2i32l9yp7bt0b.cloudfront.net/fusion/1.14.1-v.2018.11.23.3/linux/NativeScriptSidekick-amd64.deb")
sha512sums_x86_64=('681e2a5733db1f8fa5a6b468638cc3088516f25c5d7116542d1ee4d9484974ef8afe72e739b7611e47f1d20cf66b0e621ee219fcf550e079531f2da492c972fe')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
