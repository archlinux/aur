# Moved to AUR: GI_Jack <All American Zero>
# Original: ArchStrike <team@archstrike.org>
# Poached from Arch Strike

buildarch=1

pkgname=metasploit-payload-creator
pkgver=1.4.5
pkgrel=1
arch=('any')
pkgdesc="A wrapper to generate multiple types of payloads, based on users choice."
url="https://github.com/g0tmi1k/mpc"
license=('MIT')
depends=('bash' 'metasploit')
provides=('mpc-git')
replaces=('mpc-git')
conflicts=('mpc-git')
source=("https://github.com/g0tmi1k/mpc/archive/v${pkgver}.tar.gz")
sha512sums=('00e24f4cbd149e95b325ed040b105ad730095f6560fd7abe0f77fccce3bb28b1f4a145750ecb05821873d28650ecc9d2a453d483a707b2dd8187fac4b362c138')

package() {
  cd msfpc-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 msfpc.sh "$pkgdir/usr/bin/msfpc"
}
