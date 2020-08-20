# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=firefox-clearurls
pkgver=1.19.0
pkgrel=1
pkgdesc='Firefox addon that removes tracking elements from URLs'
arch=('any')
url='https://gitlab.com/KevinRoebert/ClearUrls'
license=('LGPL3')
source=("https://addons.mozilla.org/firefox/downloads/file/3612592/clearurls-1.19.0-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('378204ec10b7560966b757c4b24937073ee3cc98b147b61fbdabd5669ed99c21')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/'{74145f27-f039-47ce-a470-a662b129930a}.xpi'
}
