# Maintainer: imi415 <imi415 at imi dot moe>
# Author: Yilin Sun

_pkgname=hailort-firmware
pkgname=$_pkgname-8-bin
pkgver=4.23.0
pkgrel=1
pkgdesc="Firmware binary for HAILO-8 series accelerator cards"
arch=('any')
url="https://github.com/hailo-ai/hailort-drivers"
license=('Proprietary')
provides=('hailort-firmware-8' 'hailort-firmware-8-bin')
conflicts=('hailort-firmware-8' 'hailort-firmware-8-bin')
source=("hailo8_fw.$pkgver.bin::https://hailo-hailort.s3.eu-west-2.amazonaws.com/Hailo8/$pkgver/FW/hailo8_fw.$pkgver.bin")
sha256sums=('1ba9528972091ec17bebc0dc7ea2e6f4449efe70664890f6387ccbc7b60626ee')

package() {
	install -Dm644 "$srcdir/hailo8_fw.$pkgver.bin" "$pkgdir/usr/lib/firmware/hailo/hailo8_fw.bin"
}

