# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
_prgname=burnoutsharp
pkgname=burnoutsharp-bin
url="https://github.com/mnadareski/BurnOutSharp"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp')
pkgver=3.1.2
pkgrel=1
source=('https://github.com/SabreTools/BinaryObjectScanner/releases/download/3.1.2/BinaryObjectScanner_3.1.2_net8.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('2413c9ebdbbea2b0d212ef22e49438d73093241f34608173add509f60594451b'
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
