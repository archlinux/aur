# pac_manage
```
pac_manage manages your packages in a single file where you can add comments
and group your packages.

    USAGE: pac_manage [OPTIONS] OPERATION

    Available OPERATIONs:
        install
            Install all missing packages.

        update
            TODO: packages that are not installed are removed - rename command
                  to 'sync'.
            Update the package list. (New packages are added to the section
            'NEW_PACKAGES')

        remove
            Removes all packages that are installed but not in the
            package-list.

    If multiple operations are given they are carried out in the order:
        1. remove
        2. update
        3. install

    OPTIONS:
    -h --help
        Shows this help message.

    -l --list FILE_NAME
        Set the package-list file name. If the file does not exist it is
        created. (Default: '~/package-list')

    -n --no-confirm
        Don't ask for confirmations. Applys to remove and install operations.

    -d --dry-run
        Just print what would be done.


    USE CASES / EXAMPLES:
        # generate an initial package-list
        >>> pac_manage
        # edit the list to your likings (add comments, reorder entries etc.)
        >>> vim ~/package-list
        # install new packages to your system
        >>> sudo pacman -S gvim colorgcc
        # decide you want to keep them
        # save them to your package-list (1)
        >>> pac_manage update
        # install some packages
        >>> sudo pacman -S cowsay ponysay
        # test the installed applications and decide you dont want to keep them
        # remove them (restore the state from (1))
        >>> pac_manage remove
```
