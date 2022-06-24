# Maintainer: Directum.ru
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

# IMPORTANT: You must download the WebAccessAgent.deb from our App Server DirectumRX
# and place it in the directory with this PKGBUILD.
# Don't forget fix checksum for .deb file

pkgname=webaccessagent
pkgver=5.8.7
pkgrel=1
pkgdesc="DIRECTUM Web Access Agent"
arch=('x86_64')
url="http://www.directum.ru"
license=('DIRECTUM License')
groups=('')
options=('!strip' '!emptydirs')
source=("local://WebAccessAgent.deb")
sha512sums=('e67c534dfc826639486d977b7147477d28e00529cf24f455c472ef10ef9cf994a00759cad4162fa6ee9746510a01fede547b849a73093eac970f338422955d7c')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
