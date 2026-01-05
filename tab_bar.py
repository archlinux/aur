from kitty.fast_data_types import Screen, add_timer, get_options, GLFW_MOUSE_BUTTON_LEFT, GLFW_RELEASE
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb, draw_title
from kitty.utils import color_as_int

# Hardcoded Breath theme colors (hex to RGB int)
BG_COLOR = as_rgb(0x222222)  # dark gray
ACTIVE_BG = as_rgb(0x17a88b)  # #17a88b teal
ACTIVE_FG = as_rgb(0x1e2229)  # #1e2229
INACTIVE_BG = as_rgb(0x2e3440)  # #2e3440
INACTIVE_FG = as_rgb(0x7f8c8d)  # #7f8c8d
PLUS_BG = as_rgb(0x2e3440)  # same as inactive
PLUS_FG = as_rgb(0x7f8c8d)  # light gray
BORDER_COLOR = as_rgb(0x7f8c8d)  # light gray border
CLOSE_BG_ACTIVE = as_rgb(0x0d7a64)  # darker manjaro green
CLOSE_BG_INACTIVE = as_rgb(0x151515)  # near black
CLOSE_FG = as_rgb(0xffffff)  # white ×
SPLIT_BG = as_rgb(0x1a1a2e)  # dark blue-ish
SPLIT_FG = as_rgb(0x4fc3f7)  # light blue for split icons

# Track button positions (cell coordinates)
plus_button_start = 0
plus_button_end = 0
hsplit_button_start = 0
hsplit_button_end = 0
vsplit_button_start = 0
vsplit_button_end = 0
close_buttons = {}  # tab_id -> (start, end)


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global plus_button_start, plus_button_end, close_buttons
    global hsplit_button_start, hsplit_button_end, vsplit_button_start, vsplit_button_end

    # Clear close buttons on first tab
    if index == 1:
        close_buttons = {}

    # Fill background before first tab
    if index == 1 and before > 0:
        screen.cursor.bg = BG_COLOR
        screen.draw(' ' * before)

    # Draw thin separator before tab (except first)
    if index > 1:
        screen.cursor.bg = BG_COLOR
        screen.cursor.fg = BORDER_COLOR
        screen.draw('│')

    # Set tab colors
    if tab.is_active:
        screen.cursor.bg = ACTIVE_BG
        screen.cursor.fg = ACTIVE_FG
    else:
        screen.cursor.bg = INACTIVE_BG
        screen.cursor.fg = INACTIVE_FG

    # Draw tab content
    title = tab.title
    if len(title) > max_tab_length - 4:
        title = title[:max_tab_length - 5] + '…'

    screen.draw(f' {title} ')

    # Draw close button with border
    close_start = screen.cursor.x
    screen.cursor.bg = CLOSE_BG_ACTIVE if tab.is_active else CLOSE_BG_INACTIVE
    screen.cursor.fg = CLOSE_FG
    screen.draw(' × ')
    close_buttons[tab.tab_id] = (close_start, screen.cursor.x)

    # Restore tab bg for padding
    if tab.is_active:
        screen.cursor.bg = ACTIVE_BG
    else:
        screen.cursor.bg = INACTIVE_BG

    end = screen.cursor.x

    # Draw + button after last tab, split buttons at right edge
    if is_last:
        # Draw + button (new tab) right after last tab
        plus_button_start = screen.cursor.x
        screen.cursor.bg = PLUS_BG
        screen.cursor.fg = PLUS_FG
        screen.draw(' + ')
        plus_button_end = screen.cursor.x

        # Set end here - don't include fill space in tab extent
        # This allows double-click on empty space to work
        end = screen.cursor.x

        # Split button widths: ' ⬒ ' = 3, ' ⬓ ' = 3 = 6 total
        split_buttons_width = 6
        split_buttons_start = screen.columns - split_buttons_width

        # Fill space between + button and split buttons
        screen.cursor.bg = BG_COLOR
        screen.cursor.fg = 0
        fill_width = split_buttons_start - screen.cursor.x
        if fill_width > 0:
            screen.draw(' ' * fill_width)

        # Draw horizontal split button (⬒ = top/bottom stacked) at right
        hsplit_button_start = screen.cursor.x
        screen.cursor.bg = SPLIT_BG
        screen.cursor.fg = SPLIT_FG
        screen.draw(' ⬒ ')
        hsplit_button_end = screen.cursor.x

        # Draw vertical split button (⬓ = side by side) at right
        vsplit_button_start = screen.cursor.x
        screen.cursor.bg = SPLIT_BG
        screen.cursor.fg = SPLIT_FG
        screen.draw(' ⬓ ')
        vsplit_button_end = screen.cursor.x

        # Don't update end - keep it at + button position

    return end


# Monkey patch TabManager to handle button clicks
def _patch_tab_manager():
    from kitty.tabs import TabManager
    from kitty.boss import get_boss

    original_handle_click = TabManager.handle_click_on_tab

    def patched_handle_click(self, x: int, button: int, modifiers: int, action: int) -> None:
        # Convert pixel x to cell x
        if self.tab_bar.laid_out_once:
            cell_x = (x - self.tab_bar.window_geometry.left) // self.tab_bar.cell_width

            if button == GLFW_MOUSE_BUTTON_LEFT and action == GLFW_RELEASE:
                # Check if click is on + button
                if plus_button_start <= cell_x < plus_button_end:
                    self.new_tab()
                    return

                # Check if click is on horizontal split button (─ = stacked windows)
                if hsplit_button_start <= cell_x < hsplit_button_end:
                    boss = get_boss()
                    if boss and boss.active_window:
                        # Switch to splits layout first, then split
                        boss.call_remote_control(boss.active_window, ('goto-layout', 'splits'))
                        boss.call_remote_control(
                            boss.active_window,
                            ('launch', '--location=hsplit', '--cwd=current')
                        )
                    return

                # Check if click is on vertical split button (│ = side by side)
                if vsplit_button_start <= cell_x < vsplit_button_end:
                    boss = get_boss()
                    if boss and boss.active_window:
                        # Switch to splits layout first, then split
                        boss.call_remote_control(boss.active_window, ('goto-layout', 'splits'))
                        boss.call_remote_control(
                            boss.active_window,
                            ('launch', '--location=vsplit', '--cwd=current')
                        )
                    return

                # Check if click is on a close button
                for tab_id, (start, end) in close_buttons.items():
                    if start <= cell_x < end:
                        tab = self.tab_for_id(tab_id)
                        if tab is not None:
                            self.remove(tab)
                        return

        # Fall back to original behavior
        original_handle_click(self, x, button, modifiers, action)

    TabManager.handle_click_on_tab = patched_handle_click


# Apply patch when module loads
_patch_tab_manager()
