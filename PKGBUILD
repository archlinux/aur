# Moved to AUR: GI_Jack <All American Zero>
# Original: ArchStrike <team@archstrike.org>
# Poached from Arch Strike

buildarch=1

pkgname=metasploit-payload-creator
pkgver=1.4.4
pkgrel=1
groups=('archstrike' 'archstrike-malware')
arch=('any')
pkgdesc="A wrapper to generate multiple types of payloads, based on users choice."
url="https://github.com/g0tmi1k/mpc"
license=('MIT')
depends=('bash' 'metasploit')
provides=('mpc-git')
replaces=('mpc-git')
conflicts=('mpc-git')
source=("https://github.com/g0tmi1k/mpc/archive/v${pkgver}.tar.gz")
sha512sums=('d1850f4a7d2219ab55f8fdc232d30ff00d797fd63bf6ea0fb13cced7a992796a45e1526bef9c644a568aa653bf869cfa361b83ce817323daac09fe9194d19a11')

package() {
  cd mpc-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 msfpc.sh "$pkgdir/usr/bin/msfpc"
}
