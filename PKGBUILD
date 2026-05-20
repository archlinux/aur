# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

#   ##=================================================================##
#    )                                                                  )
#   (     If you would like to participate in the Nordix project.      (
#    )                    you are most welcome                          )
#   (                               *                                  (
#    )                        Nordix project                            )
#   (           https://github.com/jimmykallhagen/Nordix               (
#    )          https://github.com/jimmykallhagen/Yggdrasil             )
#   (           https://gitlab.com/TheEnchantedPotato/nordix           (
#    )                                                                  )
#   ##=================================================================##

pkgname=zfs-destroy-snapshots
pkgver=1.0
pkgrel=1
pkgdesc="Nordix tools: Lists all ZFS datasets that have snapshots so you can choose to bulk delete all of them for that specific dataset"
arch=('x86_64' 'aarch64')
url="https://github.com/jimmykallhagen/zfs-destroy-snapshots"
license=('GPL v3')
depends=('bash' 'git' 'base-devel')
conflicts=('Microsoft-Windows')
provides=('zfs-destroy-snapshots')

_pkgsrc="nx-hyprinstall"
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$_pkgsrc"
    install -Dm755 zfs-destroy-snapshots "$pkgdir/usr/bin/zfs-destroy-snapshots"
}

