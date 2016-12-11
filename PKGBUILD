# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=netctl-dispatcher-chrony
pkgver=0.1.0
pkgrel=1
pkgdesc="A netctl dispatcher script for chrony"
arch=('any')
url="https://github.com/bertptrs/netctl-dispatcher-chrony"
license=('MIT')
groups=()
depends=('netctl' 'wpa_actiond' 'chrony')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('chrony-dispatcher' 'LICENSE')
noextract=()
sha256sums=('247dfce5e8c1378375906c89a4cf87b4e0705048de096f27472755628b45dd31'
            'b1ee9aba3fc4444990dd0f7b3e757b36575d68ed79516c19fd6f692badc2ed47')

package() {
	install -D -m 755 "chrony-dispatcher" "${pkgdir}/etc/netctl/hooks/chrony-dispatcher"
}
