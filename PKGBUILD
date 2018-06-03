# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=1.6
pkgrel=1
pkgdesc='Stuff to build packages in virtual machines'
url='http://arch.vesath.org/'
arch=('any')
license=('custom:ISC')
depends=('qemu-headless' 'openssh' 'e2fsprogs' 'parted'
         'arch-install-scripts')
source=('README'
        'LICENSE'
        'arch.build'
        'arch.install')

package() {
	cd "${srcdir}"
	install -d "${pkgdir}/usr/bin"
	install arch.* "${pkgdir}/usr/bin"
	install -d "${pkgdir}/var/lib/buildstuff"
	install -Dm644 README "${pkgdir}/usr/share/${pkgname}/README"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('6225e9cd7dbd46692d3b3ebde37a182c05863459879e99dbca5b3a4125e5eb1d'
            'acf683446e1162104759b1a75d18859b1a36ac6f3eeabb241025d0e6c37c7960'
            '42f56cebdfde7a6b4f2beb3917856d3eb37206f05f443468b6c0ddafa3dbf3a3'
            'ec9d9974fc65a670754f66aa16b6f64394fbf089685acae32e31d3727263f3ee')
