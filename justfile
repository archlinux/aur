default:
	just --list

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

push:
	git push origin master && git push gh master

push-gh:
	git push gh master

push-aur:
	git push origin master
