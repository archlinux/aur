# Parallella Firmware Files
# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>

buildarch=4

pkgbase=parallella-fpga-bitstream
pkgname=('parallella-fpga-bitstream-headless-7010' 'parallella-fpga-bitstream-headless-7020')
pkgver=2019.1
pkgrel=1
pkgdesc="Bitstream files for Parallella"
provides=("parallella-fpga-bitstream")
conflicts=("parallella-fpga-bitstream")
arch=('armv7h')
url="https://github.com/parallella/parallella-hw"
license=('GPL')
_commit=b816ab6bd866e243e0c43a5085264b38eb82060a
source=("https://github.com/parallella/parabuntu/raw/${_commit}/fpga_bitfiles/parallella_e16_headless_gpiose_7010.bit.bin"
	"https://github.com/parallella/parabuntu/raw/${_commit}/fpga_bitfiles/parallella_e16_headless_gpiose_7020.bit.bin")
sha256sums=('2bff7c43721c9f5890536cc8fc7f8016ce1b56fe64af00a5a5789311b86cbe5b'
            'e76915e02adc81770c4606c52e8a0aa82b7b146a98c6f264d1a3401a89d09a72')

package_parallella-fpga-bitstream-headless-7010() {
    pkgdesc="Bitstream files needed for Parallella (Headless, Zynq 7010)"
    install -m 0755 -d "${pkgdir}"/boot

    install -m 0755 parallella_e16_headless_gpiose_7010.bit.bin "${pkgdir}"/boot/parallella.bit.bin
}

package_parallella-fpga-bitstream-headless-7020() {
    pkgdesc="Bitstream files needed for Parallella (Headless, Zynq 7020)"
    install -m 0755 -d "${pkgdir}"/boot

    install -m 0755 parallella_e16_headless_gpiose_7020.bit.bin "${pkgdir}"/boot/parallella.bit.bin
}
