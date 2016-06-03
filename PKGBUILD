# Maintainer: Karsten Pufahl <contact@karstenpufahl.de>

pkgname=stm32cubef7
pkgver=1.4.0
pkgrel=1
pkgdesc="Embedded software for STM32 F7 series"
arch=('any')
url="http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32cube-embedded-software/stm32cubef7.html"
license=('custom:MCD-ST Liberty SW License Agreement V2')
groups=()
depends=('bash' 
		 'perl')
makedepends=('unzip')
optdepends=('arm-none-eabi-gcc: ARM compiler'
			'arm-none-eabi-gdb: ARM GDB'
			'arm-none-eabi-newlib: ARM bare metal files'
			'arm-none-eabi-binutils: ARM binutils'
			'openocd: STM32F4 firmware flashing')
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=('stm32cubef7.zip::http://www.st.com/content/ccc/resource/technical/software/firmware/18/40/6e/b0/44/f7/43/1d/stm32cubef7.zip/files/stm32cubef7.zip/_jcr_content/translations/en.stm32cubef7.zip'
		'LICENSE')
noextract=()
sha512sums=('cbaff1f1760e0e1d043cdd584953d568a0e7014cd217e9405a78069dedf4d81be1123b8de0028d2e3ab8ada2b63bd34e4f34460499e5b09a459d0c4906363e6b'
            '56b5435d98843b02ad3b735cce67b37a98e56095e7377710708c8ce9b72fc4451a314109536bcc48229697c054479b422977d337e701a07014c84fcb97cb04d8')
package() {
	install -d "$pkgdir"/opt/"$pkgname"
	mv STM32Cube_FW_F7_V$pkgver/* "$pkgdir"/opt/"$pkgname"/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
