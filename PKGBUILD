# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=buildstuff
pkgver=1.3
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
            'd79c506c8e15ac24c8509c5a90fe5cad78afcb583e68d0222c4a8176aad30847'
            'ec7d572a0a6fd43eb24d0388a30f16e3b35a48d645f0cdf426929f4cbba47d48')
