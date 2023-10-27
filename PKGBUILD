# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
_prgname=burnoutsharp
pkgname=burnoutsharp-bin
url="https://github.com/mnadareski/BurnOutSharp"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp')
pkgver=2.9.0
pkgrel=3
source=('https://github.com/mnadareski/BurnOutSharp/releases/download/2.9.0/BinaryObjectScanner_2.9.0_net7.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('59041fc6c1d39fe4c890fb8a27aa137e345c8bdd4ea618718013224c1f92b9c9'
'SKIP'
'SKIP')

package() {

	# install burnoutsharp distribution
	install -Dm 755 ${srcdir}/Test ${pkgdir}/usr/bin/${_prgname}

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}
