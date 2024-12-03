# Maintainer: kmz <valesail7@gmail.com>
pkgname=kd
pkgver=v0.0.12
pkgrel=1
pkgdesc='A command-line dictionary'
arch=('x86_64')
url='https://github.com/Karmenzind/kd'
license=('MIT')
provides=('kd')
conflicts=('kd-bin')

source=(
    "kd::https://github.com/Karmenzind/kd/releases/download/${pkgver}/kd_linux_amd64"
    # 'kd.go::https://raw.githubusercontent.com/Karmenzind/kd/main/cmd/kd.go'
)
sha256sums=('840a203b0824d0e2e1f0e0d1a548c761656625e4e72f8abd1031cc748a31fc87')

# pkgver() {
#     cat ${srcdir}/kd.go | grep 'var VERSION' | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
#     # git describe --long --abbrev=7 | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
# }

package() {
    install -Dm755 "${srcdir}/kd" "${pkgdir}/usr/bin/kd"
	# install -Dm644 LICENSE $pkgdir/usr/share/licenses/kd/LICENSE
}
