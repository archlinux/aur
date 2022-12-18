# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.5.2"
pkgrel=1
pkgdesc='a simplistic papermc helper (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('2e93a15d2370deb5b55fac540bda07bb84b286ff610ce1920fe53d3e1e7e9453')
sha256sums_x86_64=('224c9f39bf391f5203b20bb7b269f191d2531daa75f0ef289915e1fea470c5e3')
sha256sums_armv7h=('57c883cab8fb15410491bd0440487ebde183e429df88787f423750a6cede43ac')
sha256sums_armv6h=('f882313cd3520ec937362b9055122926bbfa3ff9ee6e6583fc3e3868e7716b1b')
sha256sums_aarch64=('c01a3a860b505f3f59b68511eb9b7163ac836a35532202c7541ceb98b10f99ae')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_x86_64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_i386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
depends=('pacman')
optdepends=('java-runtime: running the downloaded jarfiles')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}
