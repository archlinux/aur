# Maintainer: Reverier-Xu <reverier.xu@outlook.com>
pkgname=fcitx5-skin-fluentdark-git
_pkgname=fcitx5-skin-fluentdark-git
pkgver=v0.3.0.r0.g7755620
pkgrel=2
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
 install -Dm644 "$_name"/FluentDark/arrow.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/arrow.png
 install -Dm644 "$_name"/FluentDark/back.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/back.png
 install -Dm644 "$_name"/FluentDark/next.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/next.png
 install -Dm644 "$_name"/FluentDark/panel.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/panel.png
 install -Dm644 "$_name"/FluentDark/radio.png "$pkgdir"/usr/share/fcitx5/themes/FluentDark/radio.png
 install -Dm644 "$_name"/FluentDark/theme.conf "$pkgdir"/usr/share/fcitx5/themes/FluentDark/theme.conf
}
