# Maintainer: Konstantin Gorodinskii
pkgname=vscode-insiders
pkgver=1.19.0
pkgrel=1512540970
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
sha512sums_x86_64=('ebb1a134058e4e82c8776bf46fb85fc29d78343330a4455197470d65f35c97d61cd0b0445cc5ed02ff36f86ce9f0ab961f63492e5aea4a2e5828067364251114')

package(){
	tar xf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/${pkgname}/usr/share/"
}
