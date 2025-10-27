#!/bin/bash

echo "=== Fixing AUR Package ==="

# Create the working PKGBUILD
cat > PKGBUILD << 'SCRIPT_EOF'
# Maintainer: Rron Nurboja <rronnurboja@gmail.com>
pkgname=electrotility
pkgver=2.0.0
pkgrel=3
pkgdesc="Ultimate Linux Power Utility Tool"
arch=('any')
url="https://github.com/Rronnurboja/electrotility"
license=('GPL3')
depends=('bash')
optdepends=(
    'curl: for downloading components'
    'wget: alternative download tool'
    'git: for some development features'
)
source=("git+https://github.com/Rronnurboja/electrotility.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/electrotility"
    install -Dm755 electrotility.sh "$pkgdir/usr/bin/electrotility"
}
SCRIPT_EOF

echo "✅ PKGBUILD updated"

# Regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO
echo "✅ .SRCINFO regenerated"

# Update AUR
git add PKGBUILD .SRCINFO
git commit -m "Fix: use git source with SKIP checksum (pkgrel=3)"
git push origin master
echo "✅ AUR updated"

echo ""
echo "🎉 FIXED! Now test on Manjaro:"
echo "   yay -S electrotility"
echo ""
echo "It should work without errors!"
