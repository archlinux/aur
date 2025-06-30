pkgname=goonsh
pkgver=1.2.0
pkgrel=1
pkgdesc="a joke fr"
arch=('x86_64')
url="https://github.com/DriftFe/goonsh"
license=('GPL3')
depends=('readline')
source=(
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/goonsh.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/utils.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/history.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/config.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/completion.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/utils.h"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/history.h"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/config.h"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/completion.h"
)
sha256sums=(
  '68b8ae43b186499e621c6d51822addbc39cfc174b5b14ee1c9eb71ed78080834'
  'd9ca30c5927cb78ec1d2b9c68efe2aa6726b11e67bb8c7f0d137156a2943b0a9'
  '787a7d9e7e082709f29c47ffc8ec240e32cd1c1f44466dc0e6bceccf06dd8f3e'
  '7a98c6d099d79d1541c64b2ba65d6671d386e6e7f2f986c991f72b261b2264fd'
  '28cc7397fb3d0ddb481dd56d126dff6e401553f1e9287505d33dbea063d16226'
  '726d5250a25223e575cff45e1c84f89fa86cc2c186b6fe12db0fa043bcc883bf'
  '82d5bbe0bc16ceffbd8b0124a422c06248a92e95c172523396afdd0737611223'
  'fe220a4e5546509ab3c0bbf17d8f3886f6e78380bab68ff8137511bf7f72f6a5'
  '8557ae768fcffbfd78b76a78a7c5ba0403400c8e235d62f9870ace9d210ebb88'
)

build() {
  g++ goonsh.cpp utils.cpp history.cpp config.cpp completion.cpp -o goonsh -lreadline
}

package() {
  install -Dm755 "$srcdir/goonsh" "$pkgdir/usr/bin/goonsh"
}
