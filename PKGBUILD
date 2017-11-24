# Maintainer: NBonaparte <nbonaparte@protonmail.com>

pkgname=stm32cubeh7
pkgver=1.1.0
pkgrel=1
pkgdesc="Embedded software for STM32 H7 series"
arch=('any')
url="http://www.st.com/en/embedded-software/stm32cubeh7.html"
license=('custom:Mix Ultimate Liberty+OSS+3rd-party V1')
groups=()
depends=('bash'
	'perl')
makedepends=('libarchive')
optdepends=('arm-none-eabi-gcc: ARM compiler'
	'arm-none-eabi-gdb: ARM GDB'
	'arm-none-eabi-newlib: ARM bare metal files'
	'arm-none-eabi-binutils: ARM binutils'
	'openocd: STM32H7 firmware flashing')
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
# Newest source can always be downloaded at http://www.st.com/st-web-ui/static/active/en/st_prod_software_internet/resource/technical/software/firmware/stm32cubeh7.zip
source=('stm32cubeh7.zip::http://www.st.com/content/ccc/resource/technical/software/firmware/group0/fd/9a/b6/df/a7/3d/41/0d/stm32cubeh7.zip/files/stm32cubeh7.zip/_jcr_content/translations/en.stm32cubeh7.zip'
	'LICENSE')
noextract=()
sha512sums=('5aa8eb04e819e35e3242b69f86488bba14c69bbeddf9b35cb99397c9659d23d46991c2a12f7779036e2bc730ce14017f1f8c1fbc09c0ff41ac13018058e0e2fb'
	'8c1a849105e35b5cf1b14a411e6ab5db171a8c284abaf6d673c24963069617115cecfe0cb4fb7a04a2fb5b4e0e20b061de512c10c4d5c106e39506e04edb61e3')
package() {
	install -d "$pkgdir"/opt/"$pkgname"
	mv STM32Cube_FW_H7_V$pkgver/* "$pkgdir"/opt/"$pkgname"/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
