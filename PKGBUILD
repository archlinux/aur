# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=kiwivm-ga
pkgver=0.1.0
pkgrel=2
pkgdesc="Required package for full functionality of the BandwagonHost KiwiVM control panel."
arch=('any')
url='https://bandwagonhost.com'
#url='https://kiwivm.64clouds.com'
license=('unknown')
depends=('util-linux' 'bash')
optdepends=('kiwivm-ga-systemd: BandwagonHost KiwiVM Guest Agent systemd unit file'
            'kiwivm-ga-sysvinit: BandwagonHost KiwiVM Guest Agent sysvinit startup script')
# After installing archlinux, Bandwagonhost may add a qemu-kvm_ga file to /usr/bin.
backup=('usr/bin/qemu-kvm_ga')
source=("https://gist.githubusercontent.com/unknowndevQwQ/0852d2461b4ebbeebb58894830ff964e/raw/ba484fdd9a61589e3fbfb4bc124131e28acf755e/qemu-kvm_ga")
sha512sums=('21329a42155679a8cec4c562e12973425f7f7f8662aed54e96b4446a4fe6f2286695f2c9fe3fbf091642c36ba6568394c9b067747f78281fbf4415b5c94f36b2')

package() {
	install -Dm755 "qemu-kvm_ga" -t "${pkgdir}/usr/bin"
}
