set -l dpw_commands help edit update

complete -f -c dpw -n "not __fish_seen_subcommand_from $dpw_commands" -a help -d "Show the help menu"
complete -f -c dpw -n "not __fish_seen_subcommand_from $dpw_commands" -a edit -d "Open the packages.ini file in the user's selected editor [defined in the EDITOR variable]."
complete -f -c dpw -n "not __fish_seen_subcommand_from $dpw_commands" -a update -d "Overwrite the current contents of the package.ini file with the currently installed packages."
