# Maintainer: Amrit Ghimire <iamritghimire@gmail.com>
pkgname=jira-terminal-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
url="https://github.com/amritghimire/jira-terminal"
license=("AGPL-3.0-only")
arch=("x86_64")
provides=("jira-terminal")
source=("https://github.com/amritghimire/jira-terminal/releases/download/v$pkgver/jira-terminal-$pkgver-x86_64.tar.gz")
sha256sums=("ab1f8fd76650cdffe4f2d73c5b190bef1674df65a36518dc7ae833f8cec66419")

package() {
    install -Dm755 jira-terminal -t "$pkgdir/usr/bin/"
}
