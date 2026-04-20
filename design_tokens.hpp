// @generated from sha-web-styles/src/theme.css — DO NOT EDIT
// Regenerate: node sha-web-console/generate-design-tokens.cjs sha-web-styles/src/theme.css
#pragma once

// Design tokens — non-color SSOT. Sister of colors.hpp.
// Spacing, radius, typography, letter-spacing, transitions,
// z-index bands and panel sizing — all sourced from theme.css.

namespace ase::theme {


// -- SPACING SCALE --
constexpr int space_xs = 4;  // px
constexpr int space_sm = 8;  // px
constexpr int space_md = 16;  // px
constexpr int space_lg = 24;  // px
constexpr int space_xl = 32;  // px
constexpr int space_2xl = 48;  // px

// -- BORDER RADIUS --
constexpr int radius_sm = 4;  // px
constexpr int radius_md = 6;  // px
constexpr int radius_lg = 8;  // px
constexpr int radius_xl = 12;  // px
constexpr int radius_full = 9999;  // px

// -- TYPOGRAPHY --
inline constexpr const char* font_mono = "'Fira Code', 'JetBrains Mono', 'Consolas', monospace";
inline constexpr const char* font_sans = "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif";

// -- FONT SIZE SCALE --
constexpr int font_xs = 10;  // px
constexpr int font_sm = 11;  // px
constexpr int font_md = 12;  // px
constexpr int font_base = 13;  // px
constexpr int font_lg = 14;  // px
constexpr int font_xl = 16;  // px
constexpr int font_2xl = 18;  // px
constexpr int font_3xl = 22;  // px
constexpr int icon_card = 48;  // px
constexpr int icon_detail = 64;  // px

// -- LETTER SPACING --
constexpr double tracking_tight = 0.04;  // em
constexpr double tracking_normal = 0.05;  // em
constexpr double tracking_default = 0.08;  // em
constexpr double tracking_wide = 0.1;  // em
constexpr double tracking_wider = 0.12;  // em
constexpr double tracking_extra = 0.15;  // em

// -- TRANSITIONS --
inline constexpr const char* transition_fast = "0.15s ease";
inline constexpr const char* transition_normal = "0.25s ease";
inline constexpr const char* transition_slow = "0.4s ease";
constexpr int z_scene = 0;
constexpr int z_scene_fallback = 10;
constexpr int z_deco_horizon = 50;
constexpr int z_deco_grid = 55;
constexpr int z_label_scales = 100;
constexpr int z_label_stars = 110;
constexpr int z_ctrl_time = 150;
constexpr int z_ctrl_closeup = 160;
constexpr int z_ctrl_dim = 170;
constexpr int z_ctrl_flight = 180;
constexpr int z_hud_observatory = 200;
constexpr int z_hud_soul = 210;
constexpr int z_chrome_header = 300;
constexpr int z_chrome_nav = 310;
constexpr int z_drawer_backdrop = 400;
constexpr int z_drawer_panel = 450;
constexpr int z_drawer_legal = 480;
constexpr int z_drawer_crawl = 490;
constexpr int z_menu_dropdown = 500;
constexpr int z_menu_config = 510;
constexpr int z_menu_auth = 520;
constexpr int z_menu_audio = 540;
constexpr int z_tip = 600;
constexpr int z_tip_entity = 610;
constexpr int z_tip_starmap = 620;
constexpr int z_tip_cms = 630;
constexpr int z_tip_glossary = 640;
constexpr int z_overlay_quest = 700;
constexpr int z_overlay_quest_tip = 710;
constexpr int z_persist_hud = 800;
constexpr int z_sys_loader = 900;
constexpr int z_sys_font = 950;
constexpr int z_sys_preloader = 960;
constexpr int z_sys_splash = 990;
constexpr int z_sys_debug = 999;
constexpr int z_dropdown = 500;
constexpr int z_sticky = 310;
constexpr int z_modal = 450;
constexpr int z_overlay = 400;
constexpr int z_tooltip = 600;
constexpr int z_toast = 650;

// -- PANEL SIZING --
constexpr int panel_header_height = 40;  // px
constexpr int panel_filter_height = 34;  // px
constexpr int panel_footer_height = 40;  // px
constexpr int panel_min_height = 74;  // px
constexpr int drawer_width = 320;  // px
constexpr int drawer_toggle_width = 10;  // px
constexpr int mobile_nav_height = 56;  // px

}  // namespace ase::theme
