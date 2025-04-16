url := "https://github.com/usagi-flow/evil-helix/releases/latest/download/evil-helix-amd64-linux.tar.gz"

generate-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

hash-latest:
	curl -sL {{url}} | sha512sum

commit:
	git commit -m "release-$(date +%Y%m%d)"

install:
	makepkg -si

_bump:
	sed -Ei "s/sha512sums=.*/sha512sums=\(\"$(curl -sL {{url}} | sha512sum | cut -d' ' -f1)\"\)/g" PKGBUILD
	just generate-srcinfo
	git add PKGBUILD .SRCINFO
	just commit

bump:
	sed -Ei "s/pkgver=.*/pkgver=$(date +%Y%m%d)/g" PKGBUILD
	just _bump

bump-with date:
	sed -Ei "s/pkgver=.*/pkgver={{date}}/g" PKGBUILD
	# TODO: still uses a commit message with the current date
	just _bump

build-container-image:
	docker build -t arch-just -f Containerfile .

run-container-image:
	docker run -it --rm -v $PWD:$PWD -v /etc/passwd:/etc/passwd:ro -u 1000 --workdir $PWD arch-just
