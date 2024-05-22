generate-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

hash-latest:
	curl -sL https://github.com/usagi-flow/evil-helix/releases/latest/download/helix-amd64-linux.tar.gz | sha512sum

install:
	makepkg -si
