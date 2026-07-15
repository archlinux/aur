# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsh-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active Hyprland windows"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/discord-dynamic-status-hyprland"
license=('MIT')
depends=('glibc')
provides=('ddsh')
conflicts=('ddsh' 'ddsh-git')
source=("$url/releases/download/v$pkgver/discord-dynamic-status-hyprland")
sha256sums=('dd8ff739386b3824fed21a3f920331424a8f1cb199e7cab64a3355a90e7f0a2c')

package() {
    install -Dm755 "$srcdir/discord-dynamic-status-hyprland" "$pkgdir/usr/bin/ddsh"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'LICENSE'
MIT License

Copyright (c) 2026 Kazuha046
Copyright (c) 2026 Dae Euhwa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
LICENSE
}
