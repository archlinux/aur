#!/usr/bin/env bash

# Get the releases using GitHub API
RELEASES=$(curl -s "https://api.github.com/repos/starkware-libs/cairo/releases/latest")
VERSION=$(echo $RELEASES | jq .tag_name | sed 's/"//g')
DOWNLOAD_DIR="https://github.com/starkware-libs/cairo/archive/refs/tags/$VERSION.tar.gz"

curl -sLOJ $DOWNLOAD_DIR

SHA256_HASH=$(sha256sum "cairo-${VERSION#v}.tar.gz" | awk '{print $1}')
rm cairo-${VERSION#v}.tar.gz

VERSION=($(echo $VERSION | grep -oE '^[^-]+|-.*'))

cat >"PKGBUILD" <<EOL
pkgname="cairo-lang"
pkgver=${VERSION[0]#v}
release="${VERSION[1]}"
pkgdesc="Cairo language installation"
pkgrel="1"
arch=("x86_64")
url="https://cairo-by-example.com/"
license=('APACHE')
depends=("git" "rustup")
source=("$DOWNLOAD_DIR")
sha256sums=("$SHA256_HASH")

prepare() {
	rustup override set stable
	rustup update
}

build() {
	cd "cairo-\$pkgver\$release"
	cargo build --all --release --manifest-path ./Cargo.toml
}

package() {
	mkdir -p \$pkgdir/usr/bin/ \$pkgdir/usr/lib/

	mv cairo-\$pkgver\$release/corelib/ \$pkgdir/usr/lib/
	
	pkgs=("cairo-run" "cairo-compile" "cairo-format" "cairo-language-server" "cairo-test" "sierra-compile" "starknet-compile" "starknet-sierra-compile")
	
	for pkg in \${pkgs[@]}; do
		mv cairo-\$pkgver\$release/target/release/\$pkg \$pkgdir/usr/bin/
	done
	
	add_to_config
}

add_to_config() {
	declare -A shells=( ["bash"]=".bashrc" ["fish"]=".config/fish/config.fish" ["zsh"]=".zshrc")

	echo "export CARGO_MANIFEST_DIR=\"/usr/bin/corelib/\"" >> /home/\$USER/\${shells[\$(basename \$(echo \$SHELL))]}
}
EOL

cat >".SRCINFO" <<EOL
pkgbase = cairo-lang
  pkgdesc = Cairo language installation
  pkgver = ${VERSION[0]#v}
  pkgrel = 1
  url = https://cairo-by-example.com/
  arch = x86_64
  license = APACHE
  depends = git
  depends = rustup
  source = $DOWNLOAD_DIR
  sha256sums = $SHA256_HASH
pkgname = cairo-lang
EOL
