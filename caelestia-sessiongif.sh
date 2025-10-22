#/bin/bash

# Build
# - Folder is in ~/Pictures/SessionGifs
# - The current gif is placed in ~/Pictures/SessionGifs/current/current.gif
#
# Workflow
# 1. If not created yet, make the tree structure 
#    - ~/Pictures/SessionGifs
#    - ~/Pictures/SessionGifs/current
# 2. Convert in a temp dir all the gifs to resize them to 64x64 using magick
#
# 3. Show current gif to user (using Kitty protocol if possible, if not, use xdg-open)
# 
# 4. Show all possible gifs in ~/Pictures/SessionGifs
# 
# 5. Ask user which gif to set as current
#
# 6. Remove old gif in ~/Pictures/SessionGifs/current
# 
# 7. Depending on the choice of the user, place the new gif in ~/Pictures/SessionGifs/current
#    - Named current.gif
#    - magick on it to double its delay time (x2)


# Parse options
CLEAN_THUMBS=0

for arg in "$@"; do
    case "$arg" in
        --clean-thumbnails)
            CLEAN_THUMBS=1
            ;;
    esac
done


GIF_DIR="$HOME/Pictures/SessionGifs"
CURRENT_DIR="$GIF_DIR/current"
CURRENT_GIF="$CURRENT_DIR/current.gif"
THUMB_DIR="$HOME/.cache/sessiongif_thumbs"
THUMB_SIZE=48
PADDING=0

# Check if ImageMagick is installed
if command -v magick >/dev/null 2>&1; then
    is_imagemagick_installed=1
else
    is_imagemagick_installed=0
fi


# Functions
init_dirs() {
    mkdir -p "$CURRENT_DIR"
    mkdir -p "$THUMB_DIR"
}

show_current_gif() {
    if [ -f "$CURRENT_GIF" ]; then
        if [ -n "$KITTY_WINDOW_ID" ]; then
            echo "Current gif:"
            kitty +kitten icat "$CURRENT_GIF"
        else
            xdg-open "$CURRENT_GIF"
        fi
    else
        echo "No current gif set."
    fi
}

generate_thumbnails2() {
    local i=1
    for g in "$GIF_DIR"/*.gif; do
        [ -f "$g" ] || continue
        thumb="$THUMB_DIR/$(basename "$g")"
        # Generate thumbnail if it doesn't exist
        if [ ! -f "$thumb" ] && [ $is_imagemagick_installed -eq 1 ]; then
            magick "$g" -coalesce -resize "${THUMB_SIZE}x${THUMB_SIZE}" "$thumb"
        elif [ ! -f "$thumb" ]; then
            cp "$g" "$thumb"
        fi
    done
}

generate_thumbnails() {
    local gif_count thumb_count
    gif_count=$(find "$GIF_DIR" -maxdepth 1 -type f -iname "*.gif" | wc -l)
    thumb_count=$(find "$THUMB_DIR" -maxdepth 1 -type f -iname "*.gif" | wc -l)

    # --- Étape 1 : Nettoyer les miniatures orphelines ---
    for thumb in "$THUMB_DIR"/*.gif; do
        [ -f "$thumb" ] || continue
        local base=$(basename "$thumb")
        if [ ! -f "$GIF_DIR/$base" ]; then
            echo "Removing orphaned thumbnail: $base"
            rm -f -- "$thumb"
        fi
    done

    # --- Étape 2 : Vérifier s’il faut régénérer ---
    if [ "$gif_count" -gt "$thumb_count" ]; then
        echo "New GIFs detected, generating missing thumbnails..."
        for g in "$GIF_DIR"/*.gif; do
            [ -f "$g" ] || continue
            local thumb="$THUMB_DIR/$(basename "$g")"
            if [ ! -f "$thumb" ]; then
                if [ $is_imagemagick_installed -eq 1 ]; then
                    magick "$g" -coalesce -resize "${THUMB_SIZE}x${THUMB_SIZE}" "$thumb"
                else
                    cp "$g" "$thumb"
                fi
            fi
        done
    fi
}


display_gifs() {
    local gifs=("$@")
    local i=1
    for g in "${gifs[@]}"; do 
        if [ $is_imagemagick_installed -eq 1 ] && [ -n "$KITTY_WINDOW_ID" ]; then
            kitty +kitten icat --align left --no-trailing-newline "$g"

            local padding=$(( ($THUMB_SIZE / 2) / 16 ))
            #printf '\n%.0s' $(seq 1 $padding)
            echo "$(printf '%*s' "$PADDING")[$i] $(basename "$g")"
            #printf '\r%.0s' $(seq 1 $padding)

        else 
            echo "[$i] $(basename "$g")"
        fi
        ((i++))
    done
}

choose_gif() {
    local gifs=("$@")
    read -rp "Enter number of the GIF to set as current: " choice

    if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#gifs[@]}" ]; then
        echo "Invalid choice."
        exit 1
    fi

    echo "${gifs[$((choice - 1))]}"
}

get_frame_count() {
    local gif="$1"
    if [ $is_imagemagick_installed -eq 1 ]; then
        magick identify -format "%n\n" "$gif" | head -n 1
    else
        echo 0
    fi
}

reload_caelestia() {
    caelestia shell -k
    sleep 0.5
    caelestia shell -d >/dev/null 2>&1
}

set_current_gif() {
    local input_gif="$1"
    rm -f "$CURRENT_GIF"
    cp "$new_gif" "$CURRENT_GIF"
    #new_frame_delay=$(( frame_count * 55 / 100 )) # = * 0.55
    #magick "$input_gif" -coalesce -set delay "$new_frame_delay" "$CURRENT_GIF"
    #magick "$input_gif" -coalesce -set delay '%[fx:t*0.55]' "$CURRENT_GIF"
    reload_caelestia
}



# Main Script

# Clean thumbnails if requested
if [ "$CLEAN_THUMBS" -eq 1 ]; then
    echo "Cleaning thumbnails in $THUMB_DIR..."
    rm -f "$THUMB_DIR"/*.gif
fi

init_dirs
show_current_gif

generate_thumbnails
wait
mapfile -t thumbs < <(find "$THUMB_DIR" -maxdepth 1 -type f -iname "*.gif")
mapfile -t gifs < <(find "$GIF_DIR" -maxdepth 1 -type f -iname "*.gif")


echo -e "\nAvailable GIFs in $GIF_DIR:"
display_gifs "${thumbs[@]}"

new_gif=$(choose_gif "${gifs[@]}")
set_current_gif "$new_gif"



