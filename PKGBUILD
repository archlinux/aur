# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Kevin K. <kbknapp at gmail dot com>

_pkgname=clog
pkgname=${_pkgname}-bin
pkgver=0.9.2
pkgrel=1

pkgdesc='Generate beautiful changelogs from your Git commit history'
arch=('x86_64')
url='https://github.com/clog-tool/clog-cli'
license=('MIT')

makedepends=()
provides=('clog')
conflicts=('clog-git')
replaces=('clog-git')

source_i686=(
    'https://github.com/clog-tool/clog-cli/releases/download/v0.9.2/clog-v0.9.2-i686-unknown-linux-gnu.tar.gz'
)
sha512sums_i686=(
    '114d952c651ceb00695c2f3d250f333154d005af6892bf6015888574d33898c69984ed704c87943188add8ddaaa31715f25b2ef8cd26a7d636d16ae3b2e75fd6'
)
source_x86_64=(
    'https://github.com/clog-tool/clog-cli/releases/download/v0.9.2/clog-v0.9.2-x86_64-unknown-linux-gnu.tar.gz'
)
sha512sums_x86_64=(
    '1045059d2edf7c72859e4069307ed1f95eec4443c781b655bbcb5fb5dd890861699491e5f2bb63476aa18cf07f8a003881bdb99134a1dbbf572086daff0ce0f3'
)

package() {
    install -Dm 0755 clog "${pkgdir}/usr/bin/${_pkgname}"
}

