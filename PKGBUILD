# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=1pass-autologin
pkgver=1.0.0
pkgrel=2
pkgdesc="1Password Automatic Login with Polkit"
arch=('any')
url="https://gist.github.com/ShayBox/177fee12bc424dfe79507cb4c827bc7d"
license=('MIT')
source=("00-1password.rule")
sha512sums=('47b973d34a7b31825351a0b33a4a136f2911ef09b5b1837090aeafe41f80e24bdf6d2ab24775cbe67d79ef2f8a2d4e7f23d3a09e098263a4380340902a32e607')
optdepends=('1password' "1password-beta")

package() {
  install -Dm755 00-1password.rule "$pkgdir/usr/share/polkit-1/rules.d/00-1password.rule"
}
