# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=3.3.2
pkgrel=1
pkgdesc='a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
_github_url="https://github.com/mikefarah/yq"
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::https://github.com/mikefarah/yq/releases/download/${pkgver}/yq_linux_amd64")
sha256sums=('0b0700cfee1d642a0a19f8f9261b2f0a11b7174ef8bcd39e9ed334d9519f0125')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}
