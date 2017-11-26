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
source_x86_64=(code-insiders_${pkgver}-${pkgrel}.deb::https://vscode-update.azurewebsites.net/latest/linux-deb-x64/insider)
sha512sums_x86_64=('a998146429a564b8cc214f76f53c6a823a364655404f4b50573550a87147a158f8dbcaa851df51b61b7e9f6e010fb3f2dc263c9f604fb5ce83f4fd7a0264d2ee')

package(){
	tar xf data.tar.xz -C "${pkgdir}"

  install -d "${pkgdir}/${pkgname}/usr/share/"
}
