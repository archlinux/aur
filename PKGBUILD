# Maintainer: yurisuki
pkgname=osu-install
pkgver=2
pkgrel=0
pkgdesc="Auto-install osu! on Linux"
arch=('any')
url='https://github.com/yurisuki/osu-install'
depends=('dialog' 'curl' 'bash')

prepare() {
curl https://raw.githubusercontent.com/yurisuki/osu-install/master/aur/osu-installonarch.sh | /usr/bin/env bash
}
