# Maintainer: logan_reed <liulingzhang.work@icloud.com>
pkgname=aur-test-hello
pkgver=0.0.1
pkgrel=1
pkgdesc="A minimal test package for verifying AUR push workflow"
arch=('any')
url="https://github.com/awsl1414/aur-packages"
license=('MIT')
depends=('bash')

package() {
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/aur-test-hello" <<'SCRIPT'
#!/bin/bash
echo "Hello from aur-test-hello! AUR push workflow is working."
SCRIPT
}
