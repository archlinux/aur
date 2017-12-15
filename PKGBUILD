# Maintainer: Konstantin Gorodinskii
pkgname=vscode-insiders
pkgver=1.19.0
pkgrel=1513192186
pkgdesc="Visual Studio Code Insiders: code editing Redefined.."
arch=('x86_64')
url="https://code.visualstudio.com"
license=('commercial')
groups=('')

depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'gconf' 'nss'
'gcc-libs' 'libnotify' 'libxss' 'gvfs')

provides=('visual-studio-code-insiders')
replaces=('visual-studio-code-insiders')

options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=(code-insiders_${pkgver}-${pkgrel}.deb::https://vscode-update.azurewebsites.net/latest/linux-deb-x64/insider)
sha512sums_x86_64=('1f22f9a2d84de9843f72dc2816d91bd48f980b303fed5a6b5998823a321dff4eb962419f5c015f99df7e221a957b7a2c8ff4e46237e8e998db878c533c47eb69')

package(){
	tar xf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/${pkgname}/usr/share/"
}
