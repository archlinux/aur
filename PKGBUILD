# Maintainer: Isaac True <isaac.true@gmail.com>
pkgname=stm32cubef4
pkgver=1.6.0
pkgrel=1
pkgdesc="Embedded software for STM32 F4 series"
arch=('any')
url="http://www.st.com/web/catalog/tools/FM147/CL1794/SC961/SS1743/LN1897/PF259243"
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
source=('stm32cubef4.zip::http://www.st.com/st-web-ui/static/active/en/st_prod_software_internet/resource/technical/software/firmware/stm32cubef4.zip'
		'LICENSE')
noextract=()
sha512sums=('674317be4b0bd6442d96cdabba9c4224fb9e75e614c708d7ed8fb2e3bbf058220127030846264d9ea485262de9dc28bfc04f259ad2989a29ce7bb20bfa0984ae'
            'ebb2626eee93b15f5633f8271898e2b4ed737141d9fe9fe84633a81cbe9bfccdeec5d3a7390c0bac017f1711531b6692f08047973c99c84a642771ee9edba310')
package() {
	install -d "$pkgdir"/opt/"$pkgname"
	mv STM32Cube_FW_F4_V$pkgver/* "$pkgdir"/opt/"$pkgname"/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
