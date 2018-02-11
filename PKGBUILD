# Maintainer: koneu <koneu93 at googlemail dot com>

pkgname='koneu-misc'
pkgver='3'
pkgrel=0
pkgdesc='random systemd stuff I wanted packaged'
arch=('any')
optdepends=('btrfs-progs: for btrfs snapshots'
'curl: for hosts and resolvconf updates')
source=('btrfs-snap-daily@.service'
'btrfs-snap-daily@.timer'
'btrfs-snap-weekly@.service'
'btrfs-snap-weekly@.timer'
'btrfs-snap-monthly@.service'
'btrfs-snap-monthly@.timer'
'pulseaudio.service'
'resolvconf.service'
'resolvconf.timer')
md5sums=('a9d4154e77860db1a19d1aa6be1e81a0'
         '0ab8db3f58905b2bdee31685125227eb'
         '44ed4855f537154b079bee47f2d13934'
         '76fe79faa8920e5dfa269d9c32e092d7'
         'b1dba675932f6ef3d60f402cfac7a8e5'
         '2d4c5cd5fbd513d250dc756c011f5fcd'
         '92ceb9169eeff1c11323b0f99a935560'
         '08e1bce9b6ff0fb38dc1a80d3ea47901'
         '0ab8db3f58905b2bdee31685125227eb')

package() {
	install -Dm644 "${srcdir}/btrfs-snap-daily@.service" "${pkgdir}/usr/lib/systemd/system/btrfs-snap-daily@.service"
	install -Dm644 "${srcdir}/btrfs-snap-daily@.timer" "${pkgdir}/usr/lib/systemd/system/btrfs-snap-daily@.timer"
	install -Dm644 "${srcdir}/btrfs-snap-weekly@.service" "${pkgdir}/usr/lib/systemd/system/btrfs-snap-weekly@.service"
	install -Dm644 "${srcdir}/btrfs-snap-weekly@.timer" "${pkgdir}/usr/lib/systemd/system/btrfs-snap-weekly@.timer"
	install -Dm644 "${srcdir}/btrfs-snap-monthly@.service" "${pkgdir}/usr/lib/systemd/system/btrfs-snap-monthly@.service"
	install -Dm644 "${srcdir}/btrfs-snap-monthly@.timer" "${pkgdir}/usr/lib/systemd/system/btrfs-snap-monthly@.timer"
	install -Dm644 "${srcdir}/pulseaudio.service" "${pkgdir}/usr/lib/systemd/system/pulseaudio.service"
	install -Dm644 "${srcdir}/resolvconf.service" "${pkgdir}/usr/lib/systemd/system/resolvconf.service"
	install -Dm644 "${srcdir}/resolvconf.timer" "${pkgdir}/usr/lib/systemd/system/resolvconf.timer"
}
