# Maintainer: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: phiresky <phireskyde+aur@gmail.com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=pacman-log-foreign-hook
pkgver=1.0
pkgrel=1
pkgdesc='Hook to list packages not part of a pacman database (foreign) via pacman -Qm after every pacman run'
url='https://aur.archlinux.org/packages/pacman-log-foreign-hook'
arch=('any')
license=('GPL3')
source=('log-foreign.hook')
b2sums=('db782f45a1aa512c16f9b54e6831e4ca2215a0ed1b2951cef6650dc1880af7b7e958466bf9b41d9fa54c83056b0613195199f3332cf26d439a2c7c459390c4d7')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" log-foreign.hook
}
