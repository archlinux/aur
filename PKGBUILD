# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=fcitx5-skin-fluentdark-git
_pkgname=fcitx5-skin-fluentdark-git
pkgver=v0.4.0.r0.g83a6ccc
pkgrel=1
pkgdesc="A Fluent-Design dark theme with blur effect and shadow."
arch=('x86_64')
url="https://github.com/Reverier-Xu/FluentDark-fcitx5"
license=('MPL')
depends=('fcitx5')
makedepends=()
provides=()
source=('git+https://github.com/Reverier-Xu/FluentDark-fcitx5.git')
md5sums=('SKIP')
_name=FluentDark-fcitx5
prepare() {
  cd $_name
}

pkgver() {
  cd $_name
  git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
 # FluentDark
 install -Dm644 "$_name"/FluentDark/arrow.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/arrow.png
 install -Dm644 "$_name"/FluentDark/back.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/back.png
 install -Dm644 "$_name"/FluentDark/next.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/next.png
 install -Dm644 "$_name"/FluentDark/panel.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/panel.png
 install -Dm644 "$_name"/FluentDark/radio.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/radio.png
 install -Dm644 "$_name"/FluentDark/theme.conf "$pkgdir"/usr/share/fcitx5/themes/FluentDark/theme.conf

 # FluentDark-solid
 install -Dm644 "$_name"/FluentDark-solid/arrow.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark-solid/arrow.png
 install -Dm644 "$_name"/FluentDark-solid/back.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark-solid/back.png
 install -Dm644 "$_name"/FluentDark-solid/next.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark-solid/next.png
 install -Dm644 "$_name"/FluentDark-solid/panel.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark-solid/panel.png
 install -Dm644 "$_name"/FluentDark-solid/radio.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark-solid/radio.png
 install -Dm644 "$_name"/FluentDark-solid/theme.conf "$pkgdir"/usr/share/fcitx5/themes/FluentDark-solid/theme.conf
}
