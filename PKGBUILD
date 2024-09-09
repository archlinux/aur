# Maintainer: kmz <valesail7@gmail.com>
pkgname=kd
pkgver=v0.0.11
pkgrel=1
pkgdesc='A command-line dictionary'
arch=('x86_64')
url='https://github.com/Karmenzind/kd'
license=('MIT')
provides=('kd')
conflicts=('kd-bin')

source=(
    'kd::https://github.com/Karmenzind/kd/releases/latest/download/kd_linux_amd64'
    # 'kd.go::https://raw.githubusercontent.com/Karmenzind/kd/main/cmd/kd.go'
)
sha256sums=('24b046b8e9448dfb9fa5ab45b759293ded8ec8a338ce2a718956f37c129feec1')

# pkgver() {
#     cat ${srcdir}/kd.go | grep 'var VERSION' | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
#     # git describe --long --abbrev=7 | grep -o 'v[0-9]\+.[0-9]\+.[0-9]\+'
# }

package() {
    install -Dm755 "${srcdir}/kd" "${pkgdir}/usr/bin/kd"
	# install -Dm644 LICENSE $pkgdir/usr/share/licenses/kd/LICENSE
}
