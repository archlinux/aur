# Maintainer: jswagner <jason-at-jason;swag'ner*dot,com>
_prgname=ProtectionScan
pkgname=burnoutsharp-bin
url="https://github.com/SabreTools/BinaryObjectScanner"
arch=('x86_64')
license=('MIT')
options=('!strip')
pkgdesc="Protection, packer, and archive scanning library"
provides=('burnoutsharp' 'binaryobjectscanner')
pkgver=3.5.0
pkgrel=1
source=('https://github.com/SabreTools/BinaryObjectScanner/releases/download/3.5.0/ProtectionScan_3.5.0_net10.0_linux-x64_release.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('83fc66bfa79b0285a8bd77829098bca869bf9587f0ce8938a0cb636a57e02edc'
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
