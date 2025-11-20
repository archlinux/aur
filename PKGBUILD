# Maintainer: jswagner <jason-at-jason;swag'ner*dot,com>
_prgname=ProtectionScan
pkgname=burnoutsharp-bin
url="https://github.com/SabreTools/BinaryObjectScanner"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp' 'binaryobjectscanner')
pkgver=3.4.6
pkgrel=1
source=('https://github.com/SabreTools/BinaryObjectScanner/releases/download/3.4.6/ProtectionScan_3.4.6_net9.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('bcd9dec3191cc5a1d3471b3917d9d4f66298876676f4e3a04999fe6c7d059419'
'SKIP'
'SKIP')

package() {

	# install burnoutsharp distribution
	install -Dm 755 ${srcdir}/ProtectionScan ${pkgdir}/usr/bin/${_prgname}

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

}
