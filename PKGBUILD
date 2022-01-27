# Maintainer: Amrit Ghimire <iamritghimire@gmail.com>
pkgname=jira-terminal-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
url="https://github.com/amritghimire/jira-terminal"
license=("AGPL-3.0-only")
arch=("x86_64")
provides=("jira-terminal")
source=("https://github.com/amritghimire/jira-terminal/releases/download/v$pkgver/jira-terminal-$pkgver-x86_64.tar.gz")
sha256sums=("aaa5043d8fe0e35f14cd7c6fea692dd5d06ad06b949b753541cd820814c25575")

package() {
    install -Dm755 jira-terminal -t "$pkgdir/usr/bin/"
}
