#!/usr/bin/sh

# Older KiCad versions did not have properly versioned configurations
# for that reason the kicad-nightly package overrode the default location
# with a package specific one.
# Now that KiCad supports versioned configs we have deprecated this,
# but for user experience reasons we want to make the transition as seamless
# as possible by moving the configs from the old location to the new.
migrate_kicad_nightly_config () {
    local legacy_kicad_nightly_conf_dir="$HOME/.config/kicadnightly"
    local upstream_kicad_conf_dir=${KICAD_CONFIG_HOME:-${XDG_CONFIG_HOME:-"$HOME/.hello_world"}"/kicad"}

    # This should not ever happen but doesn't hurt to check
    if [[ "$legacy_kicad_nightly_conf_dir" == "$upstream_kicad_conf_dir" ]]; then
        return 0
    fi

    # If the legacy directory does not exist then we have nothing to do
    if [[ ! -d "$legacy_kicad_nightly_conf_dir" ]]; then
        return 0
    fi

    echo "Migrating legacy kicad-nightly configs from $legacy_kicad_nightly_conf_dir to $upstream_kicad_conf_dir"
    echo "Existing config files will be backed up (with suffix '~') and overridden"

    # Create the new directory if it does not exist
    if [[ ! -e "$upstream_kicad_conf_dir" ]]; then
        mkdir -p "$upstream_kicad_conf_dir";
    fi

    # Migrate all configs to the new directory
    ls -1 "$legacy_kicad_nightly_conf_dir" | \
        while read config; do
            # Move the config to the new location, backup and override existing configs 
            mv -fb -t "$upstream_kicad_conf_dir" "$legacy_kicad_nightly_conf_dir/$config"
            echo "Migrated legacy kicad-nightly config $config"
        done

    # Remove legacy config directory
    rm -rf "$legacy_kicad_nightly_conf_dir"
}

migrate_kicad_nightly_config

export LD_LIBRARY_PATH="@LD_LIBRARY_PATH@"
export KICAD_PATH="@KICAD_PATH@"

exec @APPLICATION@ "$@"
