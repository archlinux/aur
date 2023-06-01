# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Fire100265 <fire100265@outlook.com>
pkgname=timeshift-bin
pkgver=23.06.1
pkgrel=1
pkgdesc="A system restore utility for Linux"
arch=('x86_64')
#arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/linuxmint/timeshift"
license=('GPL3')
depends=('cronie' 'gtk3' 'libgee' 'libnotify' 'libsoup' 'rsync' 'vte3' 'which'
         'xapp' 'xorg-xhost')
optdepends=('btrfs-progs: BTRFS support'
            'grub-btrfs: BtrfS snapshots in grub')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://launchpad.net/~linuxmint-daily-build-team/+archive/ubuntu/daily-builds/+files/${pkgname%-bin}_${pkgver}-unstable-202306011106~ubuntu23.04.1_amd64.deb")
sha256sums=('8814b007b9eae3410cfea71dc466b3ca303420c2a7192aff035efe4167d40eae')
#source_x86_64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_amd64.deb")
#source_aarch64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_arm64.deb")
#source_riscv64=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-bin}_${pkgver}-1_riscv64.deb")
#sha256sums_x86_64=('a10a439f3259dd10b77ed883855cec8425c06c0516b231ea2ece7c9539d28460')
#sha256sums_aarch64=('2d8184b38c532693374deaedf871c6987846b187a786b72b0ff7a173b033b266')
#sha256sums_riscv64=('ae65276830fb3b6a46d3f31bc1f729883f000927ddc3dae012913f9eded75057')

package() {
  bsdtar -xvf data.tar.zst -C "$pkgdir"
}
