# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=2.0
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
            '5c32ace856a43cfeb83821cab0b4ed83647098bb3a63d57316c939df8517464f'
            '8f33b668ab81dcefd62191c3a01d596d498b8ba1058368dbb1ca2a2a2bf89218')
