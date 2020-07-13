# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=otf-literata
pkgver=1.00
pkgrel=4
pkgdesc="Google's default typeface for Play Books. Android distribution."
arch=('any')
url="https://play.google.com/store/apps/details?id=com.google.android.apps.books"
license=('custom:propietary')
depends=('fontconfig' 'xorg-font-util')
conflicts=('ttf-literata')
replaces=('ttf-literata')
source=("com.google.android.apps.books_5.10.7_RC05.319870197-103226_minAPI19(nodpi)_apkmirror.com.apk::https://www.apkmirror.com/wp-content/uploads/2020/07/67/5f070980a7eaf/com.google.android.apps.books_5.10.7_RC05.319870197-103226_minAPI19(nodpi)_apkmirror.com.apk?verify=1594662909-nZP9_5OM6BQ_EisVxH0zWKUrO0C-QjjSZBLRoBINXu0")
b2sums=('ff6d98c2ec6f4c40a918a92825312ee0ade662cd5cf3ecb082a338faabdf8240f6dda6923bc0a2ca195f5bab0270514526f35d0292f6514f64b8ab8cb44d536e')

package() {
  cd "$srcdir/assets/fonts"

  install -dm755 "$pkgdir/usr/share/fonts/OTF/literata"

  install -m644 literata*.otf "$pkgdir/usr/share/fonts/OTF/literata"
}
