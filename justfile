url := "https://github.com/usagi-flow/evil-helix/releases/latest/download/helix-amd64-linux.tar.gz"

generate-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

hash-latest:
	curl -sL {{url}} | sha512sum

commit:
	git commit -m "release-$(date +%Y%m%d)"

install:
	makepkg -si

bump:
	sed -Ei "s/pkgver=.*/pkgver=$(date +%Y%m%d)/g" PKGBUILD
	sed -Ei "s/sha512sums=.*/sha512sums=\(\"$(curl -sL {{url}} | sha512sum | cut -d' ' -f1)\"\)/g" PKGBUILD
	just generate-srcinfo
	git add PKGBUILD .SRCINFO
	just commit
