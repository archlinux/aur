# Maintainer: E5ten <e5ten.arch@gmail.com>

pkgname=yq-bin
pkgver=2.4.0
pkgrel=1
pkgdesc='a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::https://github.com/mikefarah/yq/releases/download/${pkgver}/yq_linux_amd64")
sha256sums=('99a01ae32f0704773c72103adb7050ef5c5cad14b517a8612543821ef32d6cc9')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

