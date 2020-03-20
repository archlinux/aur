# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=kiwivm-ga
pkgver=0.1.0
pkgrel=1
pkgdesc="This package is required for full functionality of KiwiVM."
arch=('any')
url='https://kiwivm.64clouds.com'
license=('custom')
depends=('util-linux' 'bash')
optdepends=('kiwivm-ga-systemd: KiwiVM Guest Agent systemd unit file'
            'kiwivm-ga-sysvinit: KiwiVM Guest Agent sysvinit startup script')
backup=('usr/bin/qemu-kvm_ga')
source=("qemu-kvm_ga::https://gist.githubusercontent.com/unknowndev233/0852d2461b4ebbeebb58894830ff964e/raw/ba484fdd9a61589e3fbfb4bc124131e28acf755e/qemu-kvm_ga")
sha512sums=('21329a42155679a8cec4c562e12973425f7f7f8662aed54e96b4446a4fe6f2286695f2c9fe3fbf091642c36ba6568394c9b067747f78281fbf4415b5c94f36b2')

package() {
	install -Dm755 "${srcdir}/qemu-kvm_ga" "${pkgdir}/usr/bin/qemu-kvm_ga"
}
