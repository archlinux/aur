# $Id$
# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_ver_num='0.5'
_ver_full="$_ver_num-beta"

pkgname=bullettrain
pkgver="${_ver_full/-/}"
pkgrel=3
pkgdesc='Bullettrain prompt builder written in Go'
url='https://github.com/bullettrain-sh'
arch=('i686' 'x86_64')
license=('MIT')
depends=('nerd-fonts-complete')
source_i686=("bullettrain-i686::https://github.com/bullettrain-sh/bullettrain-go-core/releases/download/v$_ver_full/bullettrain.linux-386")
sha256sums_i686=('34d8b6b9d2f4e3c6833e7bed089db7ff97d5e05081d967a2132a6f1bc7adbbc2')
source_x86_64=("bullettrain-x86_64::https://github.com/bullettrain-sh/bullettrain-go-core/releases/download/v$_ver_full/bullettrain.linux-amd64")
sha256sums_x86_64=('367fa7d00badd31c05dea19a9c8dee4be68fe1ce31311a8716c838762bcbe418')

package() {
    install -Dm755 "bullettrain-$CARCH" "$pkgdir/usr/bin/bullettrain"
}
