# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=huawei-me936-udev
pkgver=1
pkgrel=1
pkgdesc="Udev rule and configs for the Huawei ME936 modem"
arch=('any')
source=("77-huawei-me936.rules"
        "modprobe.d-huawei-me936.conf"
        "modules-load.d-huawei-me936.conf")
sha256sums=('e0e0c590d032b3141a980d89df27cb6c99e54937bd4d76945f99fa2c4decdb52'
            '79ad582f7bb0d7e4c65b827f7a42e124b5a173bf5e33d1fb15f75d12b20c9c1a'
            'cb117683456fbf25affb2ef434c3d743af55d053ac16af2bc4eea0114c424401')

package() {
  install -Dm644 77-huawei-me936.rules -t "$pkgdir/etc/udev/rules.d"
  install -Dm644 modprobe.d-huawei-me936.conf "$pkgdir/etc/modprobe.d/huawei-me936.conf"
  install -Dm644 modules-load.d-huawei-me936.conf "$pkgdir/etc/modules-load.d/huawei-me936.conf"
}
