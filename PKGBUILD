# Maintainer: Darius Berghe <mail@dari.bz>

pkgname=stm32cubel4
pkgver=1.11.0
pkgrel=1
pkgdesc="Embedded software for STM32 L4 series"
arch=('any')
url="http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32cube-embedded-software/stm32cubel4.html"
license=('custom:MCD-ST Liberty SW License Agreement V2')
groups=()
depends=('bash' 
		 'perl')
makedepends=('unzip')
optdepends=('arm-none-eabi-gcc: ARM compiler'
			'arm-none-eabi-gdb: ARM GDB'
			'arm-none-eabi-newlib: ARM bare metal files'
			'arm-none-eabi-binutils: ARM binutils'
			'openocd: firmware flashing tool')
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=('stm32cubel4.zip::http://www.st.com/content/ccc/resource/technical/software/firmware/ca/20/a3/1a/24/48/42/24/stm32cubel4.zip/files/stm32cubel4.zip/_jcr_content/translations/en.stm32cubel4.zip'
		'LICENSE')
noextract=()
sha512sums=('208ee694a5eb13e65bb9fc966572a4bc484a55fea7d10413e98dc9cae09fa9a15f78e18f932fc3f694df13746c867bae6d4f36f0b26190aceb1d95391dc5fbef'
            '56b5435d98843b02ad3b735cce67b37a98e56095e7377710708c8ce9b72fc4451a314109536bcc48229697c054479b422977d337e701a07014c84fcb97cb04d8')
package() {
	install -d "$pkgdir"/opt/"$pkgname"
	mv STM32Cube_FW_L4_V$pkgver/* "$pkgdir"/opt/"$pkgname"/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
