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
sha256sums=('a1a225e9a161899b3815c23afa90482ea88dba1786fb6738153859f98a6f0e86')

# pkgver() {
#     cat ${srcdir}/kd.go | grep 'var VERSION' | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
#     # git describe --long --abbrev=7 | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
# }

package() {
    install -Dm755 "${srcdir}/kd" "${pkgdir}/usr/bin/kd"
	# install -Dm644 LICENSE $pkgdir/usr/share/licenses/kd/LICENSE
}
