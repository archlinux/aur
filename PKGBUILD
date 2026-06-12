# Maintainer: AlaEldin Mohamed <aeiedamo@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: pyjano <pyjano at protonmail dot com>

pkgname=otf-ibm-plex
epoch=2
# Currently IBM Plex doesn't have a consistent version scheme across all fonts
# so just use date of last commit and change pkgrel if needed.
pkgver=2026.04.21
pkgrel=1
pkgdesc="IBM Plex typefaces in otf format"
url="https://github.com/IBM/plex"
arch=("any")
license=('custom:OFL')
source=(
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans@1.1.0/ibm-plex-sans.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-serif@2.0.0/ibm-plex-serif.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-mono@2.5.0/ibm-plex-mono.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-math@1.1.0/ibm-plex-math.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-arabic@1.1.0/ibm-plex-sans-arabic.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-condensed@2.0.0/ibm-plex-sans-condensed.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-devanagari@1.1.0/ibm-plex-sans-devanagari.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-hebrew@1.1.0/ibm-plex-sans-hebrew.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-jp@3.0.0/ibm-plex-sans-jp.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-kr@1.1.0/ibm-plex-sans-kr.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-tc@1.1.1/ibm-plex-sans-tc.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-sc@1.1.0/ibm-plex-sans-sc.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-thai@1.1.0/ibm-plex-sans-thai.zip"
	"https://github.com/IBM/plex/releases/download/@ibm/plex-sans-thai-looped@1.1.0/ibm-plex-sans-thai-looped.zip"
)
sha256sums=('fb365d910566e6d199cc2c15579a7dd9a267128e18431a394ed81f1970c69200'
            'c006b095c47b919c6c8d78319e9e628745033f5db94507c1c9dfe4b35dd51f1e'
            '6d23f01257663d8cc49a0d64c22ced630b79e0e2a0ac08a0da86e9a38bbc481c'
            'd85ed404394ced3a79a519af24611acdee9cc0483363c07cd5ac0656c06db42a'
            'f03915581aea37d82792c188b08064023a73494d679b8e19f85f5971db714013'
            'f86ba73abbeed7cf7690ead863192a87211dfc2b0cef0ac6bf4700533ec5ab9e'
            'effc4a35b2908c80806c97a4d5033e63f437611d17a3e09b237edd5c33d8ac94'
            'd7d490b8a767b972a7f361055fdcf60ad7cb7c270b38ff1bf859562a021369fd'
            '4c14c41552934b0bc92fc216a76b36bdc78f745dfbeed1115f9b8bc405ee314f'
            '9837800c8e5aedf4123775e1d767afa482c983321bd2fc606c985f405d24562e'
            'b79600d3c9155fa05c9024eb81cfe2fbdd8cd068503dfafd79405ea577aa9fec'
            '0aabd737c8ef0206892b912c759101c10b86c6244be99f2e6b57c6905c716837'
            'd7203f43c20f9abd40487f845c48db4077d2056ea18632c8959591c6815d7fb9'
            '26c453e3a4341026e2f5525cd498c5aa214e57bdb9db99bc3816826a36be157f')

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
