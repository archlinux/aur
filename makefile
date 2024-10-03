.PHONY: all
all: download checksums update_pkgbuild test_makepkg update_srcinfo clean

.PHONY: download
download:
# TODO

.PHONY: checksums
checksums:
# TODO

.PHONY: update_pkgbuild
update_pkgbuild:
# TODO

.PHONY: test_makepkg
test_makepkg:
	@echo "Testing PKGBUILD..."
	@makepkg --syncdeps --cleanbuild
	@echo "PKGBUILD test completed successfully."

.PHONY: update_srcinfo
update_srcinfo:
	@makepkg --printsrcinfo > .SRCINFO
	@echo "Updated .SRCINFO file."

.PHONY: clean
clean:
	@git clean -fdX
	@echo "Cleanup complete."
