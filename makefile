all: alias cell context_menu copy crosshair grabbing hand1 hand2 help left_ptr move nodrop sb_h_double_arrow sb_v_double_arrow top_left_corner top_right_corner xterm xterm_horiz zoom_in zoom_out

alias:
	printf "25 11 12 alias_25.png\n50 22 23 alias_50.png" | xcursorgen - alias

cell:
	printf "25 11 11 cell_25.png\n50 23 23 cell_50.png" | xcursorgen - cell

context_menu:
	printf "25 3 2 context_menu_25.png\n50 6 4 context_menu_50.png" | xcursorgen - context_menu

copy:
	printf "25 12 12 copy_25.png\n50 25 25 copy_50.png" | xcursorgen - copy

crosshair:
	printf "25 12 12 crosshair_25.png\n50 24 24 crosshair_50.png" | xcursorgen - crosshair

grabbing:
	printf "25 12 12 grabbing_25.png\n50 25 25 grabbing_50.png" | xcursorgen - grabbing

hand1:
	printf "25 12 12 hand1_25.png\n50 25 25 hand1_50.png" | xcursorgen - hand1

hand2:
	printf "25 9 3 hand2_25.png\n50 19 6 hand2_50.png" | xcursorgen - hand2

help:
	printf "25 3 2 help_25.png\n50 6 4 help_50.png" | xcursorgen - help

left_ptr:
	printf "25 3 2 left_ptr_25.png\n50 4 6 left_ptr_50.png" | xcursorgen - left_ptr

move:
	printf "25 11 11 move_25.png\n50 23 23 move_50.png" | xcursorgen - move

nodrop:
	printf "25 12 12 nodrop_25.png\n50 25 25 nodrop_50.png" | xcursorgen - nodrop

sb_h_double_arrow:
	printf "25 11 11 sb_h_double_arrow_25.png\n50 23 23 sb_h_double_arrow_50.png" | xcursorgen - sb_h_double_arrow

sb_v_double_arrow:
	printf "25 11 11 sb_v_double_arrow_25.png\n50 23 23 sb_v_double_arrow_50.png" | xcursorgen - sb_v_double_arrow

top_left_corner:
	printf "25 11 11 top_left_corner_25.png\n50 23 23 top_left_corner_50.png" | xcursorgen - top_left_corner

top_right_corner:
	printf "25 11 11 top_right_corner_25.png\n50 23 23 top_right_corner_50.png" | xcursorgen - top_right_corner

xterm:
	printf "25 12 11 xterm_25.png\n50 24 24 xterm_50.png" | xcursorgen - xterm

xterm_horiz:
	printf "25 11 11 xterm_horiz_25.png\n50 25 23 xterm_horiz_50.png" | xcursorgen - xterm_horiz

zoom_in:
	printf "25 10 10 zoom_in_25.png\n50 20 20 zoom_in_50.png" | xcursorgen - zoom_in

zoom_out:
	printf "25 10 10 zoom_out_25.png\n50 20 20 zoom_out_50.png" | xcursorgen - zoom_out
