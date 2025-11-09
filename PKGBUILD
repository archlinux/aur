# Contributor: pyjano <pyjano at protonmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Adrià Arrufat <swiftscythe at gmail dot com>
# Maintainer: AlaEldin Mohamed <aeiedamo@gmail.com>

pkgname=otf-ibm-plex
epoch=1
pkgver=1.1.0
pkgrel=5
pkgdesc="IBM Plex typefaces in otf format"
url="https://github.com/IBM/plex"
arch=("any")
license=("custom")
source=(
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans@${pkgver}/ibm-plex-sans.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-serif@${pkgver}/ibm-plex-serif.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-mono@${pkgver}/ibm-plex-mono.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-math@${pkgver}/ibm-plex-math.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-arabic@${pkgver}/ibm-plex-sans-arabic.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-condensed@${pkgver}/ibm-plex-sans-condensed.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-devanagari@${pkgver}/ibm-plex-sans-devanagari.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-hebrew@${pkgver}/ibm-plex-sans-hebrew.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-jp@3.0.0/ibm-plex-sans-jp.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-kr@${pkgver}/ibm-plex-sans-kr.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-tc@1.1.1/ibm-plex-sans-tc.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-sc@${pkgver}/ibm-plex-sans-sc.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-thai@${pkgver}/ibm-plex-sans-thai.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-thai-looped@${pkgver}/ibm-plex-sans-thai-looped.zip"
)
sha256sums=(
'fb365d910566e6d199cc2c15579a7dd9a267128e18431a394ed81f1970c69200'
'76f1a272b084d2beedcd22aaaa653bc6f92b71b5689081aef9c5b05d0a470e1b'
'4bfc936d0e1fd19db6327a3786eabdbc3dc0d464500576f6458f6706df68d26c'
'd85ed404394ced3a79a519af24611acdee9cc0483363c07cd5ac0656c06db42a'
'f03915581aea37d82792c188b08064023a73494d679b8e19f85f5971db714013'
'c172bedb417831bc6ba35ccb727f33959b7f2f8382902386947660bcd66a8077'
'effc4a35b2908c80806c97a4d5033e63f437611d17a3e09b237edd5c33d8ac94'
'd7d490b8a767b972a7f361055fdcf60ad7cb7c270b38ff1bf859562a021369fd'
'4c14c41552934b0bc92fc216a76b36bdc78f745dfbeed1115f9b8bc405ee314f'
'9837800c8e5aedf4123775e1d767afa482c983321bd2fc606c985f405d24562e'
'b79600d3c9155fa05c9024eb81cfe2fbdd8cd068503dfafd79405ea577aa9fec'
'0aabd737c8ef0206892b912c759101c10b86c6244be99f2e6b57c6905c716837'
'd7203f43c20f9abd40487f845c48db4077d2056ea18632c8959591c6815d7fb9'
'26c453e3a4341026e2f5525cd498c5aa214e57bdb9db99bc3816826a36be157f'
)

package() {
		install -Dm644 ibm-plex-sans/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE.txt
		install -d "$pkgdir"/usr/share/fonts/OTF
		find ibm-plex-sans/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-serif/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-mono/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-math/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-arabic/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-condensed/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-devanagari/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-hebrew/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-jp/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-kr/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-sc/fonts/complete/otf/hinted -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-tc/fonts/complete/otf/hinted -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-thai/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
		find ibm-plex-sans-thai-looped/fonts/complete/otf -name "*.otf" -exec install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF \;
}
