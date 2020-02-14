# Maintainer: S. D. Cloudt < stefan dot cloudt at outlook dot com >
pkgname=rsnapshot-systemd
pkgver=1.1
pkgrel=1
pkgdesc="Contains systemd services and timers for rsnapshot"
arch=('any')
depends=('rsnapshot')
source=('rsnapshot-hourly@.timer'
		'rsnapshot-daily@.timer'
		'rsnapshot-weekly@.timer'
		'rsnapshot-monthly@.timer'
		'rsnapshot-hourly@.service'
		'rsnapshot-daily@.service'
		'rsnapshot-weekly@.service'
		'rsnapshot-monthly@.service')

package() {
	install -dm755 "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-hourly@.timer" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-daily@.timer" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-weekly@.timer" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-monthly@.timer" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-hourly@.service" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-daily@.service" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-weekly@.service" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-monthly@.service" "${pkgdir}/etc/systemd/system"
}

sha512sums=('c4b9a6e1a3fafa125c4fa49e70776941f058ba5262f943e1049b0bd1f5e51252db82c35a3339862b2a06596909c6d4add1f0ac24971a4054b1285bf40e9b7ea1'
            '33cbb604a0d8ac1e16bc2fcf45c3518e39b0ddd2aaad18919cdcfa86273a6df6138094b8110513a4bdbb4da90b25eef3b248eb3f22a22f102a0278d695f26d60'
            'd73124b7a6d2ab19de922eb85caf678ea9e0b59be4369fb59f4c4b814c1bd05888c8ba66d09dc44bd44d0667c59517193b97323841b561795c78320d44d0f3bc'
            '9b552fb302c9af58fb7d23054616e18d2cfae21f1f45a73f0837084acdbfb2d37a5c43c22b62d19f0ee703e5275d01cc92c22d01504a738162f8fa6b1a72ac79'
            '95b394881f439831ca4827952b61da15fa3cdeb69992e9daeb0e4adc2afc9b4462c6e410982d8499bcf4aa7a4dbbe4d9e1f0ff1882c49f04ce09a2828ca92839'
            'edfe32c5829a5c05b5da34f5b27b5ba5fa5e28335448984bf58c770a68df37bf8440348987a49aa41d06fa9f2c181190981d7688a49ea51fa221013dbb89e15a'
            'c21917011e1000557ab787a4345119fa601ee478e623f2aaff52bd624572de2299c068cf150465dbfeae2bdadbe2de1433c3c3666e0eb703137109e65033ccc5'
            'b3d4c537d2ed52a15d73bd7c372c9299ee95200db091b8060f0a2740fea40661dbfa0d4d6b300d194ac9a89a3c12e9010f45ecb304d678221e59063047cf7f1c')
