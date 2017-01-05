# Maintainer: koneu <koneu93 at googlemail dot com>

pkgname='koneu-misc'
pkgver='0'
pkgrel=0
pkgdesc='random systemd stuff I wanted packaged'
arch=('any')
optdepends=('btrfs-progs: for btrfs snapshots'
'curl: for hosts and resolvconf updates')
source=('btrfs-snap@.service'
'btrfs-snap@.timer'
'hosts.service'
'hosts.timer'
'pulseaudio.service'
'resolvconf.service'
'resolvconf.timer')
md5sums=('f614ac43af79546afeda6ccb7387f095'
'0ab8db3f58905b2bdee31685125227eb'
'5d506d10510672d6438c31e399f36001'
'0ab8db3f58905b2bdee31685125227eb'
'8a636e2d607a5e83f4f5d8936f6b4844'
'4877a74e7674a16536ef8d3c3548ea9d'
'0ab8db3f58905b2bdee31685125227eb')

package() {
	install -Dm644 "${srcdir}/btrfs-snap@.service" "${pkgdir}/usr/lib/systemd/system/btrfs-snap@.service"
	install -Dm644 "${srcdir}/btrfs-snap@.timer" "${pkgdir}/usr/lib/systemd/system/btrfs-snap@.timer"
	install -Dm644 "${srcdir}/hosts.service" "${pkgdir}/usr/lib/systemd/system/hosts.service"
	install -Dm644 "${srcdir}/hosts.timer" "${pkgdir}/usr/lib/systemd/system/hosts.timer"
	install -Dm644 "${srcdir}/pulseaudio.service" "${pkgdir}/usr/lib/systemd/system/pulseaudio.service"
	install -Dm644 "${srcdir}/resolvconf.service" "${pkgdir}/usr/lib/systemd/system/resolvconf.service"
	install -Dm644 "${srcdir}/resolvconf.timer" "${pkgdir}/usr/lib/systemd/system/resolvconf.timer"
}
