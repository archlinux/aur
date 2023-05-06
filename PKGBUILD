# Maintainer: Aram Hamo <contact at aramhamo dot me>
pkgname=totp-cli-git
pkgver=0.2.0
pkgrel=0
pkgdesc="Command Line Application for managing your totp tokans, written in Bash script"
arch=( 'x86_64' )
depends=('bash' 'gnupg' 'oath-toolkit')
url="https://github.com/aram-hamo/totp-cli"
license=('GPL')

source=("$pkgver.tar.gz::https://github.com/aram-hamo/totp-cli/archive/refs/tags/$pkgver.tar.gz")
sha512sums=(SKIP)
package() {
  install -Dm755 totp-cli-$pkgver/src/totp-cli $pkgdir/usr/bin/totp-cli
  install -Dm644 totp-cli-$pkgver/src/totp-cli.bash $pkgdir/usr/share/bash-completion/completions/totp-cli
}
