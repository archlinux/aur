# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-notes-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell Notes: canvas pages, kanban, Gantt, mind maps, calendar, reminders'
depends=('synshell-core')
optdepends=('poppler-glib: PDF in the reader')
provides=('syn-notes')
conflicts=('syn-notes' 'syn-notes-git')
groups=('synshell-apps')
options=('!strip' '!debug')
noextract=('syn-notes-0.2.0-x86_64.tar.zst' 'syn-notes-0.2.0-aarch64.tar.zst')
source_x86_64=("syn-notes-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-notes-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('48345c655f8836af40d960243a4303e60f9610a32e81522e812aa4c858bc0ed1')
source_aarch64=("syn-notes-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/syn-notes-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('53118d3894d10a310874aed72e244563c39e2764a506dffc31fb87fdcaa79ef3')

package() {
    bsdtar -xpf "$srcdir/syn-notes-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
