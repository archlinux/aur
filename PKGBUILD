# Maintainer: Rafael Silva (perigoso) <perigoso@riseup.net>

pkgname='xdg-base-dir-env'
pkgver=1.0.0
pkgrel=1
arch=('any')
pkgdesc='Default XDG Base Directory environment variables.'
url='https://wiki.archlinux.org/title/XDG_Base_Directory'
licence=('MIT')
source=('50-xdg-base-dir-env.conf')
noextract=("${source[@]}")
b2sums=('024d5144074698c3e7d032f48c89a9610e1c40dbb127efa8b165b54a70a1ed3f4343829342d1a8377d9de9214ca4fa0e7c35793cd58fead40a3be2ac7d97f100')

package() {
    install -Dm644 "${source[@]}" -t "$pkgdir/usr/lib/environment.d/"
}
