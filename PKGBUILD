# Maintainer:  <fr@nz>
pkgname=otf-cool_digits
pkgver=1.000
pkgrel=1
epoch=
pkgdesc="The best digits in the world."
arch=('any')
url="https://sportsfonts.com/blog/blog/the-best-digits-in-the-world"
license=('CC BY-NC-ND 4.0')
source=("https://sportsfonts.com/CoolDigits_1.000.zip")
sha256sums=('d8be1ca6bfda36ffcc8881dcad592557187babc5e9c005b92a0b5acc92119f5b')


package() {
  cd "$srcdir/"

  install -Dt "$pkgdir"/usr/share/fonts/OTF/ CoolDigits.otf
}

# vim:set ts=2 sw=2 et:
