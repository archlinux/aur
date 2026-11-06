# Maintainer: @aardbol
pkgname=modelstudio-cli-bin
_pkgname=bl
pkgver=2.8.3
pkgrel=1
pkgdesc='Official Model Studio CLI for AI agent frameworks, exposing models, search, multimodal, and workflows as tool calls'
arch=('x86_64')
url='https://github.com/modelstudioai/cli'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('modelstudio-cli')
conflicts=('modelstudio-cli' 'modelstudio-cli-git')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('0141d92387556dee918fe4639d5e72d409b3f9d6bcdd652a76abf295cf91e57a')

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}-linux-x64" "$pkgdir/usr/bin/${_pkgname}"
}
