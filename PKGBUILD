# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=ttf-tt2020
pkgdesc='Advanced, hyperrealistic, multilingual typewriter font'
pkgver=0.2.1
pkgrel=1
license=(OFL)
url=https://copypaste.wtf/TT2020
arch=(any)
_commit=45ea0a88a083eb22071461e19b8d26cfc1920565
_basedl="https://github.com/ctrlcctrlv/TT2020/raw/$_commit/dist"
source=(
	"$_basedl/TT2020Base-Regular.ttf"
	"$_basedl/TT2020Base-Italic.ttf"
	"$_basedl/TT2020StyleB-Regular.ttf"
	"$_basedl/TT2020StyleB-Italic.ttf"
	"$_basedl/TT2020StyleD-Regular.ttf"
	"$_basedl/TT2020StyleD-Italic.ttf"
	"$_basedl/TT2020StyleE-Regular.ttf"
	"$_basedl/TT2020StyleE-Italic.ttf"
	"$_basedl/TT2020StyleF-Regular.ttf"
	"$_basedl/TT2020StyleG-Regular.ttf"
)
sha512sums=('a8c5bf330113efb69cf794109e244314104959aee7fbbce84231779c3d99d3214babfd7c61e733e87367c227853c2e55829803fff012e6ba74b6a37b7bb22996'
            '2202b6209ad31a606a4f94102ce2277f77dbbae342b03c2f5b4b59cc394c912df127c6f5ff7d8c2da4447be69014a7f1576a3b28f90621b5ede4f298d31f0968'
            '4efb716ad191b3195bfd834f9735266bdabac1c3760dba6496da5abe1e64c31eb3d986ead9ef27aeb4317ab8745791223f6dcb806a1b66c8eb1bede50cf7684d'
            '8ad049f941d0a67fffc89e51db00da70d4a1254ea67b1d73130139a6899187b2c12e15098f158eb4fe471c0279171e37a1765582b9019e4a05725fb324c77be6'
            'd07ab03e57aed20382fe2bcae32055a6433debb10998ad028d62b58706388ef28ccad1581c8b0f9ba440e63a40202082869d77bf157a364474814d48be63cf0b'
            '4e0b0501ffe2e75f4e444445c83f731ffff1be11a634e0e3d9314019b817d06a6c7d2489d02370e86990c4af8a0dfe495023c3395fbe8ff02322407d0c28a72d'
            '30eb71cb529fdf6589b5e59c6487215f6850f418a3e5eb02422dd9b77380143b0ca1d490829755f9a313eb95c3411c617aee009b143cc774b8e92004c427f746'
            'd5113b265ac3c07749cf54ac4f0ae7500aa71b73081d524c6be1acbca62588326a66af1882be5785370667f9103f16d2013442498a5b015c2b295d3dda1a6be6'
            '2178b4faff3d82f69c7d8d95d482ccee07df1e795f6164aff234229c0a5577e7125afa768ede2cbf81021491b7fb69a342f38c3339f658e5edd7bf97123cc2e1'
            'b37820ede91af96f25b46af0a231c5cae98bd095d00b637d8578eea87cf6e043c8892e5c0baa83cb3ff4b4d6452bbaf25fcf5ce1f309bbd1223ef9f2eb71ed9a')

package () {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/tt2020" "${srcdir}"/*.ttf
}
