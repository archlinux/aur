# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=upd72020x-fw
pkgver=20200826
pkgrel=1
pkgdesc="Renesas uPD720201 / uPD720202 USB 3.0 chipsets firmware"
arch=('any')
url="https://github.com/denisandroid/uPD72020x-Firmware"
license=('custom')
source=(
    "https://raw.githubusercontent.com/denisandroid/uPD72020x-Firmware/master/UPDATE.mem"
    "https://raw.githubusercontent.com/denisandroid/uPD72020x-Firmware/master/License.rtf"
)
sha512sums=(
    '1ea117f9a1a772013fb7509c76d731865e6c05ae3c55a304ff42b31ec8a474e9bf16dd1b05b2e5b666ec5fd301aefed54bfeb6bfd7c3f23dc23faf082cf2a9f7'
    'f5be9af49a6ec81f77275c6f4092e6675a707a95a33bf37eb9ba84a7226f3310eebffb7699f8b9b12110c9ca2af1a56f528a94f1e4891fd45f297affd8ebb577'
)

package() {
    install -Dm644 UPDATE.mem "$pkgdir/usr/lib/firmware/renesas_usb_fw.mem"
    install -Dm644 License.rtf "$pkgdir/usr/share/doc/$pkgname/License.rtf"
}
