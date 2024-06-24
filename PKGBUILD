# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm-bin'
_pkgname="${pkgname%-bin}"
pkgver=3.5.1
pkgrel=3
pkgdesc='Pull Request Manager for Maintainers'
url='https://ldez.github.io/prm/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${_pkgname}")

depends=('git')
makedepends=()

_repourl='https://github.com/ldez/prm'
_basedownloadurl="${_repourl}/releases/download/v${pkgver}"
_basearchive="${_pkgname}_v${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('e724293bb1eef41605503f65fd64fb188a17702623e5a94d21983a251e8a0c51')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('5aaa9af67c615924346b91c3523c424723bb485e2be0ba1355c9f0f1181334d7')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('59154ae72013048030788fdb61eb0680146ee53329e8581658a969a6ca8f19c1')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('0cae415a3ccefe6f492f7ab54c8aecfd8b0771a0837b106e18134a3344a53dd3')

package() {
	# Bin
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
