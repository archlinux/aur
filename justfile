@clean:
    git clean -xdff

@install:
    makepkg -sfc

@update:
    makepkg --nobuild && makepkg --printsrcinfo > .SRCINFO
