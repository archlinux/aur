# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
# Contributor: KickMeElmo
_prgname=mpf-check
pkgname=mpf-check-bin
url="https://github.com/SabreTools/MPF"
arch=('x86_64')
pkgdesc="Media Preservation Frontend for Aaru and Redumper in C# (.NET 4.8 version)"
provides=('mpf-check')
depends=('mono')
pkgver=2.6.6
pkgrel=1
license=('GPL3')
source=('https://github.com/SabreTools/MPF/releases/download/2.6.6/MPF.Check_2.6.6-net48.zip'
'https://raw.githubusercontent.com/SabreTools/MPF/master/README.md'
'https://raw.githubusercontent.com/SabreTools/MPF/master/LICENSE')
sha256sums=('ce2854ee601cff5062003a394d691cdb0c781d71090db336abbcacfe35589794'
'SKIP'
'SKIP')

package() {

	# install mpf-check distribution
	install -Dm 644 ${srcdir}/BinaryObjectScanner.ASN1.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.ASN1.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Builders.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Builders.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Compression.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Compression.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.FileType.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.FileType.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.GameEngine.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.GameEngine.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Interfaces.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Interfaces.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Matching.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Matching.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Models.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Models.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Packer.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Packer.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Protection.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Protection.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Utilities.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Utilities.dll
	install -Dm 644 ${srcdir}/BinaryObjectScanner.Wrappers.dll ${pkgdir}/opt/${_prgname}/BinaryObjectScanner.Wrappers.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.dll
	install -Dm 644 ${srcdir}/ICSharpCode.SharpZipLib.dll ${pkgdir}/opt/${_prgname}/ICSharpCode.SharpZipLib.dll
	install -Dm 644 ${srcdir}/mi.dll ${pkgdir}/opt/${_prgname}/mi.dll
	install -Dm 644 ${srcdir}/Microsoft.Management.Infrastructure.dll ${pkgdir}/opt/${_prgname}/Microsoft.Management.Infrastructure.dll
	install -Dm 644 ${srcdir}/Microsoft.Management.Infrastructure.Native.dll ${pkgdir}/opt/${_prgname}/Microsoft.Management.Infrastructure.Native.dll
	install -Dm 644 ${srcdir}/microsoft.management.infrastructure.native.unmanaged.dll ${pkgdir}/opt/${_prgname}/microsoft.management.infrastructure.native.unmanaged.dll
	install -Dm 644 ${srcdir}/miutils.dll ${pkgdir}/opt/${_prgname}/miutils.dll
	install -Dm 755 ${srcdir}/MPF.Check.exe ${pkgdir}/opt/${_prgname}/MPF.Check.exe
	install -Dm 644 ${srcdir}/MPF.Check.exe.config ${pkgdir}/opt/${_prgname}/MPF.Check.exe.config
	install -Dm 644 ${srcdir}/MPF.Check.pdb ${pkgdir}/opt/${_prgname}/MPF.Check.pdb
	install -Dm 644 ${srcdir}/MPF.Core.dll ${pkgdir}/opt/${_prgname}/MPF.Core.dll
	install -Dm 644 ${srcdir}/MPF.Core.pdb ${pkgdir}/opt/${_prgname}/MPF.Core.pdb
	install -Dm 644 ${srcdir}/MPF.Library.dll ${pkgdir}/opt/${_prgname}/MPF.Library.dll
	install -Dm 644 ${srcdir}/MPF.Library.pdb ${pkgdir}/opt/${_prgname}/MPF.Library.pdb
	install -Dm 644 ${srcdir}/MPF.Modules.dll ${pkgdir}/opt/${_prgname}/MPF.Modules.dll
	install -Dm 644 ${srcdir}/MPF.Modules.pdb ${pkgdir}/opt/${_prgname}/MPF.Modules.pdb
	install -Dm 644 ${srcdir}/Newtonsoft.Json.dll ${pkgdir}/opt/${_prgname}/Newtonsoft.Json.dll
	install -Dm 644 ${srcdir}/OpenMcdf.dll ${pkgdir}/opt/${_prgname}/OpenMcdf.dll
	install -Dm 644 ${srcdir}/psxt001z.dll ${pkgdir}/opt/${_prgname}/psxt001z.dll
	install -Dm 644 ${srcdir}/SabreTools.IO.dll ${pkgdir}/opt/${_prgname}/SabreTools.IO.dll
	install -Dm 644 ${srcdir}/SabreTools.Models.dll ${pkgdir}/opt/${_prgname}/SabreTools.Models.dll
	install -Dm 644 ${srcdir}/SabreTools.RedumpLib.dll ${pkgdir}/opt/${_prgname}/SabreTools.RedumpLib.dll
	install -Dm 644 ${srcdir}/SabreTools.Serialization.dll ${pkgdir}/opt/${_prgname}/SabreTools.Serialization.dll
	install -Dm 644 ${srcdir}/SharpCompress.dll ${pkgdir}/opt/${_prgname}/SharpCompress.dll
	install -Dm 644 ${srcdir}/System.Buffers.dll ${pkgdir}/opt/${_prgname}/System.Buffers.dll
	install -Dm 644 ${srcdir}/System.Memory.dll ${pkgdir}/opt/${_prgname}/System.Memory.dll
	install -Dm 644 ${srcdir}/System.Numerics.Vectors.dll ${pkgdir}/opt/${_prgname}/System.Numerics.Vectors.dll
	install -Dm 644 ${srcdir}/System.Runtime.CompilerServices.Unsafe.dll ${pkgdir}/opt/${_prgname}/System.Runtime.CompilerServices.Unsafe.dll
	install -Dm 644 ${srcdir}/System.Text.Encoding.CodePages.dll ${pkgdir}/opt/${_prgname}/System.Text.Encoding.CodePages.dll
	install -Dm 644 ${srcdir}/System.Threading.Tasks.Extensions.dll ${pkgdir}/opt/${_prgname}/System.Threading.Tasks.Extensions.dll
	install -Dm 644 ${srcdir}/UnshieldSharp.dll ${pkgdir}/opt/${_prgname}/UnshieldSharp.dll
	install -Dm 644 ${srcdir}/WiseUnpacker.dll ${pkgdir}/opt/${_prgname}/WiseUnpacker.dll
	install -Dm 644 ${srcdir}/zlib.net.dll ${pkgdir}/opt/${_prgname}/zlib.net.dll

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

	# create convenience script
	mkdir ${pkgdir}/usr/bin
	echo "#!/bin/bash" > ${pkgdir}/usr/bin/${_prgname}
	echo "mono /opt/${_prgname}/MPF.Check.exe \"\$@\"" >> ${pkgdir}/usr/bin/${_prgname}
	chmod 755 ${pkgdir}/usr/bin/${_prgname}

}
