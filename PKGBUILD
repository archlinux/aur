# Maintainer: Konstantin Gorodinskii
pkgname=vscode-insiders
pkgver=1.19.0
pkgrel=1511504133
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
source_x86_64=('https://vscode-update.azurewebsites.net/latest/linux-deb-x64/insider')
sha512sums_x86_64=('f0ca99c54cc8878818f8b3768d911e7d8d7fced507abf32d9d51a2f8fa4da6badaff5591d748abfeca9ab5e82d4ff3473a26a0d2914557fdd87ed23bdce79aec')

package(){
	tar xf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/${pkgname}/usr/share/"
}
