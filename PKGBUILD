# Maintainer: Kevin Gravier<kevin@mrkmg.com>
pkgname=nativescript-sidekick
pkgver=1.16.0.v2019.2.7.3
pkgrel=1
pkgdesc="NativeScript Sidekick is a desktop GUI that enhances the power of the NativeScript CLI and simplifies the development of mobile applications. It is designed to be a companion that complements your code editor, source control, and any other tools you use."
arch=('x86_64')
url="https://www.nativescript.org"
license=('custom')
groups=('')
depends=('desktop-file-utils' 'gconf' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("$pkgname-$pkgver.deb::https://sk-cdn.nativescript.cloud/fusion/1.16.0-v.2019.2.7.3/linux/NativeScriptSidekick-amd64.deb")
sha512sums_x86_64=('52fea9858a80c98dabe74739b17cd6fc8fd26b492289fee104a07354f9d16d83ea2d34e5202a5b4b522bf406714187f29066f837a1e3334f94a9b6f48ad4f739')

package() {
	tar xf data.tar.xz -C "${pkgdir}"

	install -d "${pkgdir}/${pkgname}/opt"
	install -d "${pkgdir}/${pkgname}/usr/share"
}
