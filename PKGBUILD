# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgbase=gtk-theme-bubble-git
pkgname=('gtk-theme-bubble-dark-blue-git'
         'gtk-theme-bubble-dark-red-git'
         'gtk-theme-bubble-darker-blue-git'
         'gtk-theme-bubble-darker-red-git'
         'gtk-theme-bubble-light-blue-git'
         'gtk-theme-bubble-light-red-git')
pkgver=r97.9f15632
pkgrel=1
pkgdesc="A GTK theme based on Arc-Theme"
arch=('any')
url="https://github.com/i-mint/Bubble"
license=('GPL3')
depends=('gtk3>=3.22')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_gtk-theme-bubble-dark-blue-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Dark-Blue \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

package_gtk-theme-bubble-dark-red-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Dark-Red \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

package_gtk-theme-bubble-darker-blue-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Darker-Blue \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

package_gtk-theme-bubble-darker-red-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Darker-Red \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

package_gtk-theme-bubble-light-blue-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Light-Blue \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

package_gtk-theme-bubble-light-red-git()  {
  provides=("${pkgname%-git}" "${pkgbase%-git}")
  conflicts=("${pkgname%-git}")

  cd "$pkgbase"
  find Bubble-Light-Red \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

