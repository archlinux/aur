# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=upd72020x-fw
pkgver=20200821
pkgrel=1
pkgdesc="Renesas uPD720201 / uPD720202 USB 3.0 chipsets firmware"
arch=('any')
url="https://github.com/denisandroid/uPD72020x-Firmware"
license=('custom')
install=$pkgname.install
source=(
    "https://raw.githubusercontent.com/denisandroid/uPD72020x-Firmware/master/UPDATE.mem"
    "$pkgname.install"
)
sha512sums=(
    '1ea117f9a1a772013fb7509c76d731865e6c05ae3c55a304ff42b31ec8a474e9bf16dd1b05b2e5b666ec5fd301aefed54bfeb6bfd7c3f23dc23faf082cf2a9f7'
    '5c2189554cd040ab358e98a717f03b85fce4adea4f1561b29938fdeaf89095c4285be9f845d1efb9be02d21a3c4269de678ba5dc32102e4595348c23ef575431'
)

package() {
    install -Dm644 UPDATE.mem "$pkgdir"/usr/lib/firmware/renesas_usb_fw.mem
}
