function show_screen_time
    set log_dir "$HOME/.local/share/screen_time"
    set today_file "$log_dir/"(date +%Y-%m-%d)".time"

    if not test -f "$today_file"
        echo "🖥  Screen time today: just started (no data yet)"
        return
    end

    set seconds (cat "$today_file")
    if test -z "$seconds"
        set seconds 0
    end

    set hours   (math --scale=0 "$seconds / 3600")
    set minutes (math --scale=0 "($seconds % 3600) / 60")

    if test $hours -ge 8
        set icon "🔴"
        set note "  Take a long break!"
    else if test $hours -ge 5
        set icon "🟡"
        set note "  Consider a break soon."
    else if test $hours -ge 2
        set icon "🟢"
        set note ""
    else
        set icon "💤"
        set note "  Fresh start!"
    end

    printf "%s Screen time today: %dh %02dm%s\n" $icon $hours $minutes $note
end
