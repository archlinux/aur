# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=fcitx5-skin-fluentlight-git
_pkgname=fcitx5-skin-fluentlight-git
pkgver=v0.4.r2.g4a65a9b
pkgrel=2
pkgdesc="A Fluent-Design light theme with blur effect and shadow."
arch=('x86_64')
url="https://github.com/Reverier-Xu/Fluent-fcitx5"
license=('MPL')
depends=('fcitx5')
makedepends=()
provides=()
source=('git+https://github.com/Reverier-Xu/Fluent-fcitx5.git')
md5sums=('SKIP')
_name=Fluent-fcitx5
prepare() {
  cd $_name
}

pkgver() {
  cd $_name
  git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
 # FluentLight
 install -Dm644 "$_name"/FluentLight/arrow.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight/arrow.png
 install -Dm644 "$_name"/FluentLight/back.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight/back.png
 install -Dm644 "$_name"/FluentLight/next.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight/next.png
 install -Dm644 "$_name"/FluentLight/panel.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight/panel.png
 install -Dm644 "$_name"/FluentLight/radio.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight/radio.png
 install -Dm644 "$_name"/FluentLight/theme.conf "$pkgdir"/usr/share/fcitx5/themes/FluentLight/theme.conf

 # FluentLight-solid
 install -Dm644 "$_name"/FluentLight-solid/arrow.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight-solid/arrow.png
 install -Dm644 "$_name"/FluentLight-solid/back.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight-solid/back.png
 install -Dm644 "$_name"/FluentLight-solid/next.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight-solid/next.png
 install -Dm644 "$_name"/FluentLight-solid/panel.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight-solid/panel.png
 install -Dm644 "$_name"/FluentLight-solid/radio.png "$pkgdir"/usr/share/fcitx5/themes/FluentLight-solid/radio.png
 install -Dm644 "$_name"/FluentLight-solid/theme.conf "$pkgdir"/usr/share/fcitx5/themes/FluentLight-solid/theme.conf
}
