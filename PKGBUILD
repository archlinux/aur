# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=chamber
_upstreamver=2.10.0
pkgver="${_upstreamver//-/_}"
pkgrel=1
pkgdesc="A tool for managing secrets using AWS SSM Parameter Store"
arch=('x86_64')
url="https://github.com/segmentio/$pkgname/"
license=('MIT')
source=("https://github.com/segmentio/$pkgname/releases/download/v$_upstreamver/$pkgname-v$_upstreamver-linux-amd64"
        "$pkgname-$_upstreamver-LICENSE::https://raw.githubusercontent.com/segmentio/$pkgname/v$_upstreamver/LICENSE")
sha256sums=('d7991809838c38c3434b8ff853074086cae0cb0d49f2012bf293e7c0b229702a'
            'feaff489d3c077f7b48cf76a5f038604338a092be379c1297c64c26c6b81714b')

package() {
  install -Dm755 "$pkgname-v$_upstreamver-linux-amd64" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname-$_upstreamver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
