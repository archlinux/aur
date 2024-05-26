# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Amr Okasha <amradel55 at gmail dot com>
# Contributor: Knight <anonymousknight96 at gmail dot com>
pkgname=digilent.adept.utilities
pkgver=2.7.1
pkgrel=2
pkgdesc="Digilent Adept Utilities."
arch=('i686' 'x86_64' 'aarch64' 'armhf')
url="https://digilent.com/reference/software/adept/start"
license=('custom')
depends=('digilent.adept.runtime>=2.21.2')
options=('!strip' '!emptydirs')

source_i686=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
source_aarch64=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-arm64.deb")
source_armhf=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-armhf.deb")

sha512sums_i686=('2d4b3674cb60c70466eb12b65c07ba498ac6a699ef920014e7e1ada9ff4f1eaa8374e5ae7f79529acfefc7326f24fe1681343f2a82d34737945d4dae58a85ff2')
sha512sums_x86_64=('535381d9638703a184227c31814a548571e77513d094cf0bea91b8c31cfb1bb563c2ac9bfae70a99d6de13d8cc73bd3177d3efcbe666f0a79d4afacf720ad04b')
sha512sums_aarch64=('e147662cbf5e6e5991358677fa9c32704a5bfc167f327154b6058bb93c7ffe0ec082e338b3d96b9d1923305b85248c7d6c7874af6b3e471fc14025b36c341c27')
sha512sums_armhf=('9d1730fd532d211b4f9c6f046a67a9f5e265e17e2ee1ad70fc340958a5e058db39987fdcb6a65bf08e0509c963773a10bcd7d019fe05758523d440918c99eb64')

package(){
	# Extract package data
	tar -xJf data.tar.xz -C "${pkgdir}"/

	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
	ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
