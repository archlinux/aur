build:
	makepkg --cleanbuild -srf && makepkg --printsrcinfo > .SRCINFO 
update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO 
