# Maintainer: S. D. Cloudt < stefan dot cloudt at outlook dot com >
pkgname=rsnapshot-systemd
pkgver=1.0
pkgrel=0
pkgdesc="Contains systemd services and timers for rsnapshot"
arch=('any')
depends=('rsnapshot')
source=('rsnapshot@.service'
		'rsnapshot-hourly.timer'
		'rsnapshot-daily.timer'
		'rsnapshot-weekly.timer'
		'rsnapshot-monthly.timer')

package() {
	install -dm644 "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot@.service" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-hourly.timer" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-daily.timer" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-weekly.timer" "${pkgdir}/etc/systemd/system"
	install -m644 "${srcdir}/rsnapshot-monthly.timer" "${pkgdir}/etc/systemd/system"
}
sha512sums=(
  'd482746e910af55b2fb5d2d2ad8e36ee58f1150f340223b580eb05c26ef11b1a91c348fb80ac45590d48c3153104817f9f856f0dd333f90c542bbe559b60ef9b'
  'f25a9fcd5c6e434a5d774a6fbc32eb189c4f4e8ce556ebee01ae65b32ae4af92490a3df7acdabba5390d18dd4fa3eb75eb9339cf2d32041cb1df6790ec876fc1'
  '7fa1e9331da9decc0f4ab3b66b30ceff90edccf7461bcad02772c578c98b7717ac45a9dbc08ec25da70c4732d654c39aecde41f4397676fcc2617867da622e03'
  'c95ff77c0d6cb54eabfea1577c22a14b2e31f84380b846b34bf732e0de5df0ebac2cb2490acc112520365ff51ca18b260f9f04930c73e327d4d4ce25ccb99f64'
  'd04db84e572b1de9edf7a3b3a2c57b27bdea7da1d635a5527b0b7637458b1c8b86c86636666ad0f95cd12df7282fb68b50e906efbdc1ad1e76cf9b9074cb0382'
)
