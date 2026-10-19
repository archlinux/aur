# Maintainer: @aardbol
pkgname=modelstudio-cli-bin
_pkgname=bl
pkgver=2.4.0
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
sha256sums_x86_64=('a7bf0828aa27eff581790f8812f407737be0214dd5ceb66d8c07dbf80cf0f536')

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}-linux-x64" "$pkgdir/usr/bin/${_pkgname}"
}
