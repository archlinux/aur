# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-cooper-hewitt'
pkgdesc='Cooper Hewitt font (TrueType version)'
pkgver='1.1'
pkgrel='1'
arch=('any')
license=('custom:OFL')
url='https://www.cooperhewitt.org/open-source-at-cooper-hewitt/cooper-hewitt-the-typeface-by-chester-jenkins/'
source=("http://chfonts.s3.amazonaws.com/CooHew-TTF-v${pkgver/./p}-public.zip"
        CooperHewitt-OFL-201406.txt)
sha512sums=('c434ade499d7c1a1e64f9f8032386899a0b3e72ebf80d7804d1f50095d3b0e8b48066da723ed97812173adda08169dcec6973a605481749a93d848e5b52707a8'
            '78dd4135f7d698cac64c26abd6eba2ca9f479af26afffe8d50153c0d5a9e19fbccbf1b65d5cc29ddc5fc601ccdfd696e81e3b65e4383309dfb18c53a1f7d5861')

package () {
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" CooperHewitt-OFL-201406.txt
	cd "CooHew-TTF-v${pkgver/./p}-public"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
}
