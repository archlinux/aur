# Maintainer: Andrei Dobrete <andy3153@protonmail.com>
# vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
pkgname=notflix-old
pkgver=1
pkgrel=1
pkgdesc="A shell script to search and stream torrents. Old version with dmenu and webtorrent"
arch=(any)
url='https://github.com/Andy3153/notflix-old'
license=('GPL3')
depends=('bash' 'coreutils' 'curl' 'dmenu' 'gawk' 'grep' 'libnotify' 'mpv' 'sed' 'webtorrent-cli')
makedepends=('git')
provides=('notflix')
conflicts=('notflix-git')
source=("git+https://github.com/Andy3153/notflix-old.git")
sha256sums=("SKIP")

package()
{
  install -Dm755 "$srcdir/$pkgname/notflix" "/usr/bin/notflix"
}
