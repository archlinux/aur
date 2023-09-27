# Maintainer: Directum.ru
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

# IMPORTANT: You must download the WebAccessAgent.deb from our App Server DirectumRX
# and place it in the directory with this PKGBUILD.
# Don't forget fix checksum for .deb file

pkgname=webaccessagent
pkgver=5.8.7
pkgrel=2
pkgdesc="DIRECTUM Web Access Agent"
arch=('x86_64')
url="http://www.directum.ru"
license=('DIRECTUM License')
groups=('')
options=('!strip' '!emptydirs')
source=("local://WebAccessAgent.deb")
sha512sums=('4bbdf39cffa810ffbfa25268c884d77ea352c755f2535c2adc90a9c06f2313c25dd7a493a4df28e2161bc35bb87c5d1dabe9683c00e9c9802e10a6825b944319')

package(){

	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

}
