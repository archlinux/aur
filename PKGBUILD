# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.14.3"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('5d5d47ff182652f37839c5c63e4bebbf9ae3e89db779eae8b557e8551070e196')
sha256sums_x86_64=('baa63cedb0476ed98d722ce37d71d22287b6aa54802c014f7772708ba247c355')
sha256sums_armv7h=('e0db05e8430749ad3c924bd668a7f4107a250fa652f8625a10f544331144ac12')
sha256sums_armv6h=('5d372f0f4c053f97518bb9683d02cecf4ffc91f49c37dd513ae8c8f6bd0aeae6')
sha256sums_aarch64=('232165c1a905873530f91fa6fb5e30d7a5a74d683b0935b5c3d19dd613b256d0')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_amd64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
optdepends=('java-runtime: running the downloaded jarfiles')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}
