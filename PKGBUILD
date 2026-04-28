# Maintainer: Mike Lei <mikelei@duck.com>

pkgname=asus-um5606-edid-firmware
pkgver=1
pkgrel=1
pkgdesc=""
url="https://gist.github.com/xuwd1/33f85bfd3a4a6f4d655604881b749111"
arch=(any)
license=(GFDL-1.3-or-later)
source=("edid_mclk_fix.bin::$url/raw/24634d15447ef7f7141e2cb8427012601fd4c284/edid_mclk_fix.bin")
b2sums=("74fae274d31776b58945550d47c89e41a28517b114523fa3a8430c3665105f65bc32a4c508cf720f9dbd16e4608fb57005fbad3c1d85eb4f3abd91428e6a61ed")

package() {
    install -Dm644 edid_mclk_fix.bin $pkgdir/lib/firmware/edid/edid_mclk_fix.bin
}
