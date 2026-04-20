// @generated from sha-web-styles/src/colors.ts — DO NOT EDIT
// Regenerate: node sha-web-console/generate-colors.cjs sha-web-styles/src/colors.ts
#pragma once

#include <cstdint>

namespace ase::colors {


// -- 1. SURFACE SCALE --
constexpr uint32_t SURFACE_0 = 0xFF000000;  // pure black base
constexpr uint32_t SURFACE_0_PANEL = 0xFF040404;  // panel bg, docs bg
constexpr uint32_t SURFACE_0_INNER = 0xFF080808;  // conic gradient inner ring
constexpr uint32_t SURFACE_1 = 0xFF0A0A0A;  // elevated level 1 (card, table bg)
constexpr uint32_t SURFACE_1_CODE = 0xFF0C0C0C;  // code block background
constexpr uint32_t SURFACE_1_ALT = 0xFF0F0F0F;  // table row alt, progress bar bg
constexpr uint32_t SURFACE_2 = 0xFF121212;  // elevated level 2
constexpr uint32_t SURFACE_2_HOVER = 0xFF151515;  // hover state
constexpr uint32_t SURFACE_3 = 0xFF1A1A1A;  // elevated level 3 (bar, table header)
constexpr uint32_t SURFACE_3_CHART = 0xFF1A1A2E;  // chart canvas (blue tint)
constexpr uint32_t SURFACE_4 = 0xFF242424;  // elevated level 4
constexpr uint32_t SURFACE_4_GRAD = 0xFF252525;  // gradient top stop
constexpr uint32_t SURFACE_5 = 0xFF2A2A2A;  // highest elevation (card, border)
constexpr uint32_t SURFACE_5_SELECT = 0xFF303030;  // selected button bg
constexpr uint32_t SURFACE_5_RULE = 0xFF353535;  // chart rule tertiary

// -- 2. TEXT SCALE --
constexpr uint32_t TEXT_DIVIDER = 0xFF3A3A3A;  // separator, pipe chars
constexpr uint32_t TEXT_DISABLED = 0xFF3A4545;  // disabled state
constexpr uint32_t TEXT_FLOW = 0xFF404040;  // flow arrow, batch status
constexpr uint32_t TEXT_DIM = 0xFF4A4A4A;  // empty state, footer
constexpr uint32_t TEXT_MUTED = 0xFF4A5A5A;  // muted text, chart label normal
constexpr uint32_t TEXT_GRAY_50 = 0xFF505050;  // mid-gray text (api tester module/phase rows)
constexpr uint32_t TEXT_LABEL = 0xFF5A5A5A;  // labels, inactive nav
constexpr uint32_t TEXT_MESSAGE = 0xFF606060;  // queue size, messages
constexpr uint32_t TEXT_IDLE = 0xFF666666;  // grid, idle state
constexpr uint32_t TEXT_PANEL_MUTED = 0xFF707070;  // panel muted
constexpr uint32_t TEXT_SECONDARY_ALT = 0xFF6A7A7A;  // secondary text
constexpr uint32_t TEXT_JSON_RAW = 0xFF808080;  // raw JSON display
constexpr uint32_t TEXT_DOCS_MUTED = 0xFF847C84;  // docs muted (mauve tint)
constexpr uint32_t TEXT_HOVER = 0xFF8A8A8A;  // hover state text
constexpr uint32_t TEXT_PRIMARY = 0xFF8A9A9A;  // primary text
constexpr uint32_t TEXT_VERSION = 0xFF8A9AA8;  // version badge (blue tint)
constexpr uint32_t TEXT_DEFAULT = 0xFF9A9A9A;  // default value text
constexpr uint32_t TEXT_LOG_DEBUG = 0xFF9CA3AF;  // log debug (slate)
constexpr uint32_t TEXT_PANEL_WHITE = 0xFFC0C0C0;  // panel white
constexpr uint32_t TEXT_LIGHT = 0xFFCCCCCC;  // light gray
constexpr uint32_t TEXT_DOCS_FG = 0xFFDDDDDD;  // docs foreground
constexpr uint32_t TEXT_TERMINAL = 0xFFE0E0E0;  // terminal output text

// -- 3. BORDER SCALE --
constexpr uint32_t BORDER_SECONDARY = 0xFF1F1F1F;  // subtle borders
constexpr uint32_t BORDER_PRIMARY = 0xFF2A2A2A;  // primary borders
constexpr uint32_t BORDER_ACTIVE = 0xFF3A5A3A;  // active/focused (green)
constexpr uint32_t BORDER_HOVER = 0xFF3A5A6A;  // hover state (blue-green)
constexpr uint32_t BORDER_CODE = 0xFF393745;  // code block border (purple-gray)
constexpr uint32_t BORDER_DOCS = 0xFF53554A;  // docs border (olive)
constexpr uint32_t BORDER_A20 = 0x33737373;  // very subtle
constexpr uint32_t BORDER_A25 = 0x40737373;  // panel subtle
constexpr uint32_t BORDER_A30 = 0x4D737373;  // light
constexpr uint32_t BORDER_A40 = 0x66737373;  // medium
constexpr uint32_t BORDER_A50 = 0x80737373;  // standard panel border
constexpr uint32_t BORDER_DARK = 0x4D262626;  // dark border
constexpr uint32_t BORDER_LOG = 0x80393745;  // log border (purple)

// -- 4. PANEL ACCENT PALETTE --
constexpr uint32_t PANEL_CYAN = 0xFF5A9CB8;
constexpr uint32_t PANEL_GREEN = 0xFF4A8C6A;
constexpr uint32_t PANEL_ORANGE = 0xFFB8863A;
constexpr uint32_t PANEL_PURPLE = 0xFF7A5A9C;
constexpr uint32_t PANEL_RED = 0xFFA84A4A;
constexpr uint32_t PANEL_YELLOW = 0xFF9C8C4A;
constexpr uint32_t PANEL_EMERALD = 0xFF3D8B6E;
constexpr uint32_t MENU_RED = 0xFF7F1D1E;  // aow-red: extracted from aow-banner.jpg UI elements
constexpr uint32_t MENU_RED_HOVER = 0x2E7F1D1E;  // aow-red hover bg (subtle)
constexpr uint32_t MENU_GREEN_DONE = 0xFF0A3D0A;  // press complete indicator (dark green)

// -- 5. SEMANTIC STATUS --
constexpr uint32_t SUCCESS_BG = 0xFF3A6A3A;
constexpr uint32_t SUCCESS_TEXT = 0xFF90EE90;
constexpr uint32_t SUCCESS_OVERLAY = 0x333A6A3A;
constexpr uint32_t SUCCESS_GLOW = 0x4D00CC00;
constexpr uint32_t SUCCESS_MUTED = 0xFF4A7A5A;  // ETL writer, success indicators
constexpr uint32_t SUCCESS_MUTED_HOVER = 0xFF3A5A4A;  // hover for success buttons
constexpr uint32_t WARNING_BG = 0xFF8A7A40;
constexpr uint32_t WARNING_TEXT = 0xFFFFCC00;
constexpr uint32_t WARNING_OVERLAY = 0x338A7A40;
constexpr uint32_t WARNING_MUTED = 0xFF8A7040;  // validator, booting/paused
constexpr uint32_t WARNING_TEXT_GOLD = 0xFFFFD067;  // log warning (gold)
constexpr uint32_t ERROR_BG = 0xFF8A4A4A;
constexpr uint32_t ERROR_TEXT = 0xFFFF5A6A;
constexpr uint32_t ERROR_OVERLAY = 0x338A4A4A;
constexpr uint32_t ERROR_GLOW = 0x4DCC0000;
constexpr uint32_t ERROR_OVERLAY_LIGHT = 0x1AA84A4A;
constexpr uint32_t ERROR_OVERLAY_MED = 0x33A84A4A;
constexpr uint32_t ERROR_OVERLAY_HEAVY = 0x66A84A4A;
constexpr uint32_t ERROR_GLOW_BORDER = 0x80A84A4A;
constexpr uint32_t DATA_MISSING_COLOR = 0xFFFF00FF;  // magenta/pink — no star spectrum uses this, instantly visible
constexpr uint32_t INFO_BG = 0xFF3A5A6A;
constexpr uint32_t INFO_TEXT = 0xFF80DEFF;
constexpr uint32_t INFO_OVERLAY = 0x333A5A6A;
constexpr uint32_t INFO_GLOW = 0x4D3A5A6A;
constexpr uint32_t INFO_MUTED = 0xFF3A6A7A;  // running, timing display
constexpr uint32_t INFO_GLOW_BORDER = 0x803A6A7A;
constexpr uint32_t INFO_ACTIVE_BG = 0x1F5A9CB8;
constexpr uint32_t INFO_ANIM_BG = 0x335A9CB8;
constexpr uint32_t ACTIVITY_AMBER = 0xFFFFB020;  // save flash, write indicator, session activity
constexpr uint32_t ACCENT_PRIMARY = 0xFF2A5A2A;  // muted green accent
constexpr uint32_t ACCENT_HOVER = 0xFF3A6A3A;  // accent hover
constexpr uint32_t ACCENT_ACTIVE = 0xFF4A7A4A;  // accent active
constexpr uint32_t WIZARD_SELECTED = 0xFF2A8A3A;  // dark green: selected checkbox, confirmed state
constexpr uint32_t WIZARD_PERF_HOT = 0xFFE06030;  // warm orange: high/extreme perf impact, hot indicator
constexpr uint32_t WIZARD_INFO_BLUE = 0xFF80C0FF;  // light blue: component counts, version badges
constexpr uint32_t WIZARD_AMBER = 0xFFF59E0B;  // amber: L4 plugin layer color
constexpr uint32_t CURATOR_AGE_FLAG = 0xFF1A0505;  // dark blackish-red: prompt contains minor-indicating terms

// -- 6. TERMINAL COLORS --
constexpr uint32_t TERM_RED = 0xFFCC0000;
constexpr uint32_t TERM_ORANGE = 0xFFFF8800;
constexpr uint32_t TERM_YELLOW = 0xFFFFCC00;
constexpr uint32_t TERM_GREEN = 0xFF00CC00;
constexpr uint32_t TERM_CYAN = 0xFF00CCCC;
constexpr uint32_t TERM_PURPLE = 0xFFAA00FF;
constexpr uint32_t TERM_PINK = 0xFFFF00CC;

// -- 7. CONNECTION STATUS --
constexpr uint32_t CONN_CONNECTED = 0xFF00CC00;
constexpr uint32_t CONN_CONNECTING = 0xFFFFCC00;
constexpr uint32_t CONN_DISCONNECTED = 0xFFCC0000;
constexpr uint32_t CONN_IDLE = 0xFF666666;

// -- 8. DOCS VIEWER --
constexpr uint32_t DOCS_H1 = 0xFF80DEFF;  // cyan — top level
constexpr uint32_t DOCS_H2 = 0xFFBAD02D;  // chartreuse — section
constexpr uint32_t DOCS_H3 = 0xFFE0A060;  // warm orange — subsection
constexpr uint32_t DOCS_H4 = 0xFFA080C0;  // muted purple — detail
constexpr uint32_t DOCS_CODE_BG = 0xFF0C0D14;  // code: blue tint
constexpr uint32_t DOCS_MATH_BG = 0xFF1A1622;  // math (KaTeX): purple tint
constexpr uint32_t DOCS_DSL_BG = 0xFF0C1214;  // DSL source: teal tint
constexpr uint32_t DOCS_TABLE_BG = 0xFF0A0C0A;  // tables: green tint
constexpr uint32_t DOCS_TABLE_HEADER = 0xFF1A1E1A;  // table header: green brighter
constexpr uint32_t DOCS_TABLE_ROW_ALT = 0xFF0F110F;  // table alt row: green slight
constexpr uint32_t DOCS_DIFF_BG = 0xFF140E0C;  // diff: amber tint
constexpr uint32_t DOCS_MERMAID_BG = 0xFF100C16;  // mermaid: indigo tint
constexpr uint32_t DOCS_SVGBOB_BG = 0xFF0C1014;  // svgbob: steel-blue tint
constexpr uint32_t DOCS_BLOCKQUOTE_BG = 0xFF100F0C;  // blockquotes: olive tint
constexpr uint32_t DOCS_MATH_BORDER = 0xFF3A3850;  // math: purple-gray
constexpr uint32_t DOCS_DSL_BORDER = 0xFF2A3A45;  // DSL: teal
constexpr uint32_t DOCS_DIFF_BORDER = 0xFF45352A;  // diff: amber
constexpr uint32_t DOCS_MERMAID_BORDER = 0xFF352A45;  // mermaid: purple
constexpr uint32_t DOCS_SVGBOB_BORDER = 0xFF2A3545;  // svgbob: steel-blue
constexpr uint32_t DOCS_BLOCKQUOTE_BORDER = 0xFF3A3828;  // blockquotes: olive
constexpr uint32_t DOCS_CALLOUT_INFO_BG = 0xFF0C1E2E;  // info: visible blue tint
constexpr uint32_t DOCS_CALLOUT_INFO_BORDER = 0xFF3A90B8;  // info: bright cyan-blue
constexpr uint32_t DOCS_CALLOUT_WARN_BG = 0xFF2A1E0C;  // warn: visible amber tint
constexpr uint32_t DOCS_CALLOUT_WARN_BORDER = 0xFFC8A030;  // warn: bright amber
constexpr uint32_t DOCS_CALLOUT_TIP_BG = 0xFF0C2210;  // tip: visible green tint
constexpr uint32_t DOCS_CALLOUT_TIP_BORDER = 0xFF30A848;  // tip: bright green
constexpr uint32_t DOCS_CALLOUT_NOTE_BG = 0xFF1C1430;  // note: visible purple tint
constexpr uint32_t DOCS_CALLOUT_NOTE_BORDER = 0xFF9050C0;  // note: bright purple
constexpr uint32_t DIFF_HEADER_BG = 0x1480DEFF;
constexpr uint32_t DIFF_ADD_BG = 0x1400C800;
constexpr uint32_t DIFF_ADD_FG = 0xFF7EE07E;
constexpr uint32_t DIFF_REMOVE_BG = 0x14FF3C3C;
constexpr uint32_t DIFF_REMOVE_FG = 0xFFE07E7E;
constexpr uint32_t DIFF_INFO_BG = 0x140078FF;

// -- 9. DOC COMPONENT STATUS (9-state lifecycle) --
constexpr uint32_t STATUS_SEED = 0xFF5A5A5A;
constexpr uint32_t STATUS_POC = 0xFF8B5A8B;
constexpr uint32_t STATUS_INIT = 0xFF6A5A8B;
constexpr uint32_t STATUS_CORE = 0xFFB8863A;
constexpr uint32_t STATUS_FEAT = 0xFF5A7A9C;
constexpr uint32_t STATUS_REFINE = 0xFF9C8C4A;
constexpr uint32_t STATUS_ALPHA = 0xFFA84A4A;
constexpr uint32_t STATUS_BETA = 0xFF7A5A9C;
constexpr uint32_t STATUS_STABLE = 0xFF4A8C6A;

// -- 10. DOC AGE --
constexpr uint32_t AGE_HOT = 0xFF4A8C6A;  // < 7 days
constexpr uint32_t AGE_WARM = 0xFF5A7A9C;  // 7-30 days
constexpr uint32_t AGE_COLD = 0xFFB8863A;  // 30-90 days
constexpr uint32_t AGE_STALE = 0xFF5A5A5A;  // > 90 days

// -- 11. API TESTER --
constexpr uint32_t API_GET_BG = 0xFF2A4A3A;
constexpr uint32_t API_GET_TEXT = 0xFF8ACA8A;
constexpr uint32_t API_POST_BG = 0xFF2A4A5A;
constexpr uint32_t API_POST_TEXT = 0xFF8ACACA;
constexpr uint32_t API_PATCH_BG = 0xFF4A4A2A;
constexpr uint32_t API_PATCH_TEXT = 0xFFCACA8A;
constexpr uint32_t API_SSE_BG = 0xFF3A3A5A;
constexpr uint32_t API_SSE_TEXT = 0xFFA8A8CA;
constexpr uint32_t API_ERROR_BG = 0xFF4A2A2A;
constexpr uint32_t API_ERROR_TEXT = 0xFFCA8A8A;
constexpr uint32_t API_ERROR_HOVER = 0xFF5A3A3A;
constexpr uint32_t API_SSE_HOVER = 0xFF4A4A6A;
constexpr uint32_t API_NEUTRAL_HOVER = 0xFF3A3A3A;
constexpr uint32_t API_READER = 0xFF4A7A8A;  // RMQ Reader
constexpr uint32_t API_VALIDATOR = 0xFF8A7040;  // Validator
constexpr uint32_t API_TRANSFORMER = 0xFF6A5080;  // Transformer
constexpr uint32_t API_WRITER = 0xFF4A7A5A;  // SQL Writer
constexpr uint32_t API_STATUS_PENDING_BORDER = 0xFF5A5A5A;
constexpr uint32_t API_STATUS_RUNNING_BORDER = 0xFF3A6A7A;
constexpr uint32_t API_STATUS_RUNNING_GLOW = 0x803A6A7A;
constexpr uint32_t API_STATUS_SUCCESS_BORDER = 0xFF4A7A5A;
constexpr uint32_t API_STATUS_SUCCESS_GLOW = 0x804A7A5A;
constexpr uint32_t API_STATUS_ERROR_BORDER = 0xFFA84A4A;
constexpr uint32_t API_STATUS_ERROR_GLOW = 0x80A84A4A;
constexpr uint32_t API_STATUS_SSE_BORDER = 0xFF6A5080;
constexpr uint32_t API_STATUS_SSE_GLOW = 0x806A5080;

// -- 12. LOG LEVELS --
constexpr uint32_t LOG_TRACE = 0xFF847C84;  // mauve
constexpr uint32_t LOG_DEBUG = 0xFF80DEFF;  // cyan
constexpr uint32_t LOG_INFO = 0xFF90EE90;  // green
constexpr uint32_t LOG_WARNING = 0xFFFFD067;  // gold
constexpr uint32_t LOG_ERROR = 0xFFFF5A6A;  // red
constexpr uint32_t LOG_CRITICAL = 0xFFFF5A6A;  // red (same as error)
constexpr uint32_t LOG_CSS_TRACE = 0xFF666666;
constexpr uint32_t LOG_CSS_DEBUG = 0xFF9CA3AF;
constexpr uint32_t LOG_CSS_INFO = 0xFF00CC00;
constexpr uint32_t LOG_CSS_WARNING = 0xFFFFCC00;
constexpr uint32_t LOG_CSS_ERROR = 0xFFCC0000;
constexpr uint32_t LOG_CSS_CRITICAL = 0xFFFF00CC;

// -- 13. CHART / DATAVIZ --
constexpr uint32_t CHART_RULE_PRIMARY = 0xFFB8863A;
constexpr uint32_t CHART_RULE_SECONDARY = 0xFF2A2A2A;
constexpr uint32_t CHART_RULE_TERTIARY = 0xFF353535;
constexpr uint32_t CHART_MARKER_PRIMARY = 0xFFB8863A;
constexpr uint32_t CHART_MARKER_SECONDARY = 0xFF5A9CB8;
constexpr uint32_t CHART_LABEL_NORMAL = 0xFF4A5A5A;
constexpr uint32_t CHART_BRIGHT_CYAN = 0xFF00FFFF;
constexpr uint32_t CHART_BRIGHT_GREEN = 0xFF00FF88;
constexpr uint32_t CHART_BRIGHT_PURPLE = 0xFFFF88FF;
constexpr uint32_t CHART_BRIGHT_YELLOW = 0xFFFFFF00;
constexpr uint32_t CHART_BRIGHT_ORANGE = 0xFFFF8844;
constexpr uint32_t CHART_CANVAS_BG = 0xFF1A1A2E;
constexpr uint32_t CHART_CANVAS_GRID = 0xFF666666;
constexpr uint32_t CHART_CANVAS_BORDER = 0xFF333333;
constexpr uint32_t CHART_CANVAS_TEXT = 0xFF888888;

// -- 14. 3D RENDERING --
constexpr uint32_t RENDER_GRID_CELL = 0xFF2A2A3A;  // grid cell (purple tint)
constexpr uint32_t RENDER_GRID_SECTION = 0xFF4A4A6A;  // grid section (purple tint)
constexpr uint32_t RENDER_FOG = 0xFF251510;  // fog color (brown-red)
constexpr uint32_t RENDER_PLAYER_LOCAL = 0xFF00FF88;  // local player (green)
constexpr uint32_t RENDER_PLAYER_OTHER = 0xFF4488FF;  // other player (blue)
constexpr uint32_t RENDER_PLAYER_TEAM = 0xFFFFAA00;  // team/faction (orange)
constexpr uint32_t RENDER_PLAYER_GENERIC = 0xFF8888FF;  // generic (light blue)
constexpr uint32_t RENDER_DEBUG_RED = 0xFFFF0000;  // debug indicator
constexpr uint32_t RENDER_EMISSIVE_LOCAL = 0xFF003322;  // local player glow
constexpr uint32_t RENDER_EMISSIVE_OTHER = 0xFF000022;  // other player glow
constexpr uint32_t RENDER_EMISSIVE_GRAY = 0xFF444444;  // generic emissive
constexpr uint32_t RENDER_WHITE = 0xFFFFFFFF;  // white material
constexpr uint32_t RENDER_BLACK = 0xFF000000;  // outline black
constexpr uint32_t RENDER_SKY_SUN = 0xFFFFEE88;  // sky/sun yellow
constexpr uint32_t RENDER_MOON_BASE = 0xFFDDDDFF;  // moon base color (blue-white)

// -- 15. ENTITY INSPECTOR --
constexpr uint32_t ENTITY_VALUE_NAN = 0xFF5A5A5A;  // NaN → gray
constexpr uint32_t ENTITY_VALUE_NUMBER = 0xFF4A8C6A;  // number → green
constexpr uint32_t ENTITY_VALUE_TRUE = 0xFF4A8C6A;  // bool true → green
constexpr uint32_t ENTITY_VALUE_FALSE = 0xFFA84A4A;  // bool false → red
constexpr uint32_t ENTITY_VALUE_STRING = 0xFFB8863A;  // string → orange
constexpr uint32_t ENTITY_VALUE_DEFAULT = 0xFF9A9A9A;  // fallback → gray
constexpr uint32_t ENTITY_TAG_BG = 0x268A5CB8;  // tag purple bg
constexpr uint32_t ENTITY_TAG_TEXT = 0xFFB888D8;  // tag purple text

// -- 16. SHADOWS & OVERLAYS --
constexpr uint32_t SHADOW_SM = 0x33000000;
constexpr uint32_t SHADOW_MD = 0x4D000000;
constexpr uint32_t SHADOW_LG = 0x66000000;
constexpr uint32_t SHADOW_XL = 0x80000000;
constexpr uint32_t OVERLAY_NAV = 0xEB0A0A0A;
constexpr uint32_t OVERLAY_MERMAID = 0x662A2A2A;
constexpr uint32_t OVERLAY_WHITE_MIN = 0x0DFFFFFF;
constexpr uint32_t OVERLAY_WHITE_LIGHT = 0x1AFFFFFF;
constexpr uint32_t OVERLAY_GRAY_ANIM = 0x335A5A5A;
constexpr uint32_t OVERLAY_LIGHTBOX = 0xE0000000;
constexpr uint32_t OVERLAY_GREEN_LIGHT = 0x4D4A8C6A;
constexpr uint32_t OVERLAY_GREEN_MED = 0x664A8C6A;

// -- 18. BOOTSTRAP LOGGER (console.log styles) --
constexpr uint32_t BOOT_CYAN = 0xFF00CED1;
constexpr uint32_t BOOT_GREEN = 0xFF32CD32;
constexpr uint32_t BOOT_YELLOW = 0xFFFFD700;
constexpr uint32_t BOOT_GRAY = 0xFF808080;
constexpr uint32_t BOOT_MAGENTA = 0xFFFF00FF;

// -- 19. GLYPH DEBUG (SVG debug overlay — path distinction + debug UI) --
constexpr uint32_t GLYPH_DBG_RED = 0xFFFF3333;  // debug path 1
constexpr uint32_t GLYPH_DBG_GREEN = 0xFF33CC33;  // debug path 2
constexpr uint32_t GLYPH_DBG_BLUE = 0xFF3388FF;  // debug path 3
constexpr uint32_t GLYPH_DBG_ORANGE = 0xFFFFAA00;  // debug path 4
constexpr uint32_t GLYPH_DBG_PURPLE = 0xFFCC44FF;  // debug path 5
constexpr uint32_t GLYPH_DBG_CYAN = 0xFF00CCCC;  // debug path 6
constexpr uint32_t GLYPH_DBG_BG = 0xFF0A0A0F;  // debug view background (blue-black)
constexpr uint32_t GLYPH_DBG_CARD_BG = 0xFF111118;  // debug card background (blue-black)
constexpr uint32_t GLYPH_DBG_CARD_BORDER = 0xFF222222;  // debug card border
constexpr uint32_t GLYPH_DBG_TEXT = 0xFFCCCCCC;  // debug body text
constexpr uint32_t GLYPH_DBG_HEADING = 0xFF888888;  // debug heading
constexpr uint32_t GLYPH_DBG_LABEL = 0xFF666666;  // debug label

// -- 20. CMS PORTAL --
constexpr uint32_t CMS_HERO_OVERLAY = 0xBF040404;
constexpr uint32_t CMS_HERO_TEXT = 0xFFFFFFFF;  // hero heading white
constexpr uint32_t CMS_CARD_BG = 0xFF0A0A0A;
constexpr uint32_t CMS_CARD_BORDER = 0xFF1A1A1A;
constexpr uint32_t CMS_CARD_HOVER = 0xFF121212;
constexpr uint32_t CMS_NAV_ACTIVE_BG = 0x145A9CB8;  // nav item active bg
constexpr uint32_t CMS_NAV_ACTIVE = 0xFF7F1D1E;  // nav active entry text + border
constexpr uint32_t CMS_NAV_PIN = 0xFF7F1D1E;  // pin button (pinned state)
constexpr uint32_t CMS_NAV_TOGGLE = 0xFF7F1D1E;  // folder-open / caret sidebar toggle
constexpr uint32_t CMS_HEADER_LABEL = 0xFF4A8C6A;  // "ASE PORTAL" header label
constexpr uint32_t CMS_HEADER_BADGE = 0xFF4A8C6A;  // PAGES badge
constexpr uint32_t CMS_SCROLL_PROGRESS = 0xFF7F1D1E;  // scroll progress bar
constexpr uint32_t CMS_SPINNER = 0xFF7F1D1E;  // loading spinner
constexpr uint32_t CMS_PATH_ARROW = 0xFF5A9CB8;  // path trace arrows (cyan)
constexpr uint32_t CMS_PATH_CURRENT = 0xFF7F1D1E;  // current page label + icon
constexpr uint32_t CMS_TITLE = 0xFF7F1D1E;  // h1 page title
constexpr uint32_t CMS_CROSSREF = 0xFF7F1D1E;  // internal cross-reference links
constexpr uint32_t CMS_GLOSSARY_TITLE = 0xFF7F1D1E;  // glossary tooltip title
constexpr uint32_t CMS_CODEFILE_HEADER = 0xFF7F1D1E;  // code file block header
constexpr uint32_t CMS_TAB_ACTIVE = 0xFF7F1D1E;  // active tab border
constexpr uint32_t CMS_TOC_ACTIVE = 0xFF7F1D1E;  // active heading in ToC
constexpr uint32_t CMS_STEPS_NUMBER = 0xFF7F1D1E;  // step number circles
constexpr uint32_t CMS_TIMELINE_DOT = 0xFF7F1D1E;  // timeline dots + icons
constexpr uint32_t CMS_CHANGELOG_ICON = 0xFF7F1D1E;  // changelog version icons
constexpr uint32_t CMS_CARD_LINK = 0xFF7F1D1E;  // card footer links
constexpr uint32_t CMS_AUTHOR_BORDER = 0xFF7F1D1E;  // author/team avatar border
constexpr uint32_t CMS_COMPARE_HIGHLIGHT = 0xFF7F1D1E;  // compare column highlight border
constexpr uint32_t CMS_ACCORDION_ICON = 0xFF7F1D1E;  // accordion chevron icon
constexpr uint32_t CMS_CALLOUT_ACCENT = 0xFF7F1D1E;  // callout accent color
constexpr uint32_t CMS_QUOTE_ACCENT = 0xFF7F1D1E;  // quote left border + source link
constexpr uint32_t CMS_MATRIX_ACCENT = 0xFF7F1D1E;  // matrix icon + header
constexpr uint32_t CMS_STATS_ACCENT = 0xFF7F1D1E;  // stats block accent
constexpr uint32_t CMS_BADGE_ACCENT = 0xFF7F1D1E;  // badge inline accent
constexpr uint32_t CMS_PREVIEW_HOVER = 0xFF7F1D1E;  // preview leaf hover
constexpr uint32_t CMS_DOWNLOAD_HOVER = 0xFF7F1D1E;  // download leaf hover
constexpr uint32_t CMS_TOOLTIP_ACCENT = 0xFF7F1D1E;  // inline tooltip accent
constexpr uint32_t CMS_CATEGORY_FEAT = 0xFF7F1D1E;  // feat category color
constexpr uint32_t CMS_MAP_ROOT = 0xFF7F1D1E;  // constellation map root nodes
constexpr uint32_t CMS_TOC_LINK = 0xFF484F58;  // muted for inactive
constexpr uint32_t CMS_WIKI_LINK = 0xFFA78BFA;  // purple for wiki links
constexpr uint32_t CMS_FIGURE_CAPTION = 0xFF636C76;  // muted caption text
constexpr uint32_t CMS_COLUMN_DIVIDER = 0xFF1A1A1A;  // subtle column separator
constexpr uint32_t CMS_GLOSSARY_UNDERLINE = 0xFF484F58;  // dotted underline for terms
constexpr uint32_t CMS_GLOSSARY_BG = 0xFF1A1A1A;  // tooltip background
constexpr uint32_t CMS_GLOSSARY_BORDER = 0xFF2A2A2A;  // tooltip border
constexpr uint32_t CMS_LANG_ACTIVE = 0xFF7F1D1E;  // dark Antares red (active lang)
constexpr uint32_t CMS_LANG_INACTIVE = 0xFF484F58;  // inactive language button
constexpr uint32_t CMS_VERSION_BG = 0xFF121212;  // version badge bg
constexpr uint32_t CMS_VERSION_TEXT = 0xFF636C76;  // version badge text
constexpr uint32_t CMS_ERROR_WARN = 0xFFF0A020;  // content-missing heading (amber)
constexpr uint32_t CMS_ERROR_HEADING = 0xFFF04040;  // network/unavailable heading (red)
constexpr uint32_t CMS_ERROR_DETAIL = 0xFF666666;  // error detail text
constexpr uint32_t CMS_CALLOUT_CYAN_BG = 0x145A9CB8;
constexpr uint32_t CMS_CALLOUT_GREEN_BG = 0x144A8C6A;
constexpr uint32_t CMS_CALLOUT_ORANGE_BG = 0x14B8863A;
constexpr uint32_t CMS_CALLOUT_PURPLE_BG = 0x147A5A9C;
constexpr uint32_t CMS_CALLOUT_RED_BG = 0x14A84A4A;
constexpr uint32_t CMS_CALLOUT_YELLOW_BG = 0x149C8C4A;
constexpr uint32_t CMS_BADGE_CYAN_BG = 0x265A9CB8;
constexpr uint32_t CMS_BADGE_GREEN_BG = 0x264A8C6A;
constexpr uint32_t CMS_BADGE_ORANGE_BG = 0x26B8863A;
constexpr uint32_t CMS_BADGE_PURPLE_BG = 0x267A5A9C;
constexpr uint32_t CMS_BADGE_RED_BG = 0x26A84A4A;
constexpr uint32_t CMS_BADGE_YELLOW_BG = 0x269C8C4A;
constexpr uint32_t CMS_ACCORDION_BG = 0xFF0A1012;  // accordion body: teal tint
constexpr uint32_t CMS_ACCORDION_HEADER_BG = 0xFF0E1416;  // accordion header: teal brighter
constexpr uint32_t CMS_TABS_BG = 0xFF0A0E12;  // tab panel: blue-teal tint
constexpr uint32_t CMS_TABS_HEADER_BG = 0xFF0E1216;  // tab bar: blue-teal brighter
constexpr uint32_t CMS_STEPS_BG = 0xFF0A1210;  // steps connector: teal-green tint
constexpr uint32_t CMS_TOC_BG = 0xFF0A1014;  // table of contents: teal tint
constexpr uint32_t CMS_TIMELINE_BG = 0xFF0C1210;  // timeline container: teal-green tint
constexpr uint32_t CMS_TERMINAL_BG = 0xFF080C0E;  // terminal body: dark blue-green
constexpr uint32_t CMS_TERMINAL_HEADER_BG = 0xFF0E1214;  // terminal title bar: blue-green brighter
constexpr uint32_t CMS_CODE_BG = 0xFF0A0C14;  // code file body: blue tint
constexpr uint32_t CMS_CODE_HEADER_BG = 0xFF10121A;  // code file header: blue brighter
constexpr uint32_t CMS_EMBED_BG = 0xFF0A0C12;  // embed container: steel-blue tint
constexpr uint32_t CMS_EMBED_HEADER_BG = 0xFF0E1016;  // embed title bar: steel-blue brighter
constexpr uint32_t CMS_KBD_BG = 0xFF12121A;  // keyboard shortcut: blue-gray tint
constexpr uint32_t CMS_KBD_BORDER = 0xFF2A2A3A;  // keyboard border: blue-gray
constexpr uint32_t CMS_MATRIX_BG = 0xFF0A0E0A;  // matrix table: green tint
constexpr uint32_t CMS_MATRIX_HEADER_BG = 0xFF0E140E;  // matrix header: green brighter
constexpr uint32_t CMS_STATS_BG = 0xFF0A0E0C;  // stats card: green-teal tint
constexpr uint32_t CMS_CHANGELOG_BG = 0xFF0C0E0A;  // changelog container: olive-green tint
constexpr uint32_t CMS_COMPARE_BG = 0xFF0A0E0C;  // compare option: green-teal tint
constexpr uint32_t CMS_AUDIO_BG = 0xFF0E0A12;  // audio container: purple tint
constexpr uint32_t CMS_AUDIO_HEADER_BG = 0xFF12101A;  // audio header: purple brighter
constexpr uint32_t CMS_VIDEO_BG = 0xFF0C0A12;  // video container: purple tint
constexpr uint32_t CMS_VIDEO_HEADER_BG = 0xFF101018;  // video header: purple brighter
constexpr uint32_t CMS_GALLERY_BG = 0xFF0A0A10;  // gallery cell: indigo tint
constexpr uint32_t CMS_TOOLTIP_BG = 0xFF101018;  // tooltip popup: purple-gray tint
constexpr uint32_t CMS_QUOTE_BG = 0xFF100E0A;  // quote body: warm amber tint
constexpr uint32_t CMS_ASIDE_BG = 0xFF120E0A;  // aside body: warm amber tint
constexpr uint32_t CMS_ASIDE_TITLE_BG = 0xFF1A140E;  // aside title bar: amber brighter
constexpr uint32_t CMS_AUTHOR_BG = 0xFF100E0C;  // author card: warm tint
constexpr uint32_t CMS_COLUMN_BG = 0xFF0C0C0C;  // column cell: neutral
constexpr uint32_t CMS_TEAM_BG = 0xFF0C0C0E;  // team member card: slight blue-neutral
constexpr uint32_t CMS_DOWNLOAD_BG = 0xFF0A0C0E;  // download button: subtle blue tint
constexpr uint32_t CMS_PREVIEW_BG = 0xFF0A0C0E;  // preview card: subtle blue tint
constexpr uint32_t CMS_PROGRESS_TRACK_BG = 0xFF0C0C0E;  // progress bar track: subtle blue-neutral
constexpr uint32_t CMS_DIVIDER = 0xFF2A2A2A;  // horizontal divider gradient center
constexpr uint32_t CMS_LANDING_GRAD_MID = 0xFF020208;  // gradient 40% (deep blue-black)
constexpr uint32_t CMS_LANDING_GRAD_END = 0xFF04040F;  // gradient 100% (dark indigo)
constexpr uint32_t CMS_LANDING_OVERLAY_80 = 0xCC000000;  // top overlay start
constexpr uint32_t CMS_LANDING_OVERLAY_30 = 0x4D000000;  // top overlay fade
constexpr uint32_t CMS_LANDING_OVERLAY_85 = 0xD9000000;  // bottom overlay start
constexpr uint32_t CMS_LANDING_OVERLAY_40 = 0x66000000;  // bottom overlay fade
constexpr uint32_t CMS_STAR_WHITE = 0xFFE8E4DC;  // star base (warm white like gate)
constexpr uint32_t CMS_STAR_WARM = 0xFFCCB890;  // star twinkle warm layer
constexpr uint32_t CMS_CONSTELLATION_LINE = 0x1FE8E4DC;  // constellation link
constexpr uint32_t CMS_CONSTELLATION_GLOW = 0x405A9CB8;  // hover glow (cyan)
constexpr uint32_t CMS_NODE_LABEL = 0xB3C8C8C8;  // node label text
constexpr uint32_t CMS_MAP_TOOLTIP_BG = 0xF20A0A0A;  // map tooltip background
constexpr uint32_t CMS_MENU_RED = 0xFF7F1D1E;  // gate accent red
constexpr uint32_t CMS_CRAWL_TITLE = 0xFF7F1D1E;  // Antares red (title + subtitle)
constexpr uint32_t CMS_CRAWL_HEADING = 0xFFE0A060;  // warm orange (section headings)
constexpr uint32_t CMS_CRAWL_COPYRIGHT = 0xFFE0A060;  // warm orange (footer, very dim via opacity)

// -- 21. STELLARIUM ANTARAE — BBoL Constellation Colors --
constexpr uint32_t STLR_GLOW_VITAL = 0xFFFF0000;  // BBoL VITAL — Life Spark
constexpr uint32_t STLR_GLOW_STRUC = 0xFF0044FF;  // BBoL STRUC — Structure (brightened from #0000FF)
constexpr uint32_t STLR_GLOW_COSMI = 0xFF4040B0;  // BBoL COSMI — Cosmic (brightened from #191970)
constexpr uint32_t STLR_GLOW_MUTAR = 0xFF8B00FF;  // BBoL MUTAR — Transformation
constexpr uint32_t STLR_GLOW_COGNI = 0xFF00FF00;  // BBoL COGNI — Cognition
constexpr uint32_t STLR_GLOW_SOCIA = 0xFF00FFFF;  // BBoL SOCIA — Social
constexpr uint32_t STLR_GLOW_FLUXO = 0xFFFF8C00;  // BBoL FLUXO — Energy
constexpr uint32_t STLR_GLOW_SENSO = 0xFFFFFF00;  // BBoL SENSO — Senses
constexpr uint32_t STLR_GLOW_TEMPO = 0xFFFF00FF;  // BBoL TEMPO — Time
constexpr uint32_t STLR_GLOW_TERRA = 0xFFA0652A;  // BBoL TERRA — Terrain (brightened from #8B4513)
constexpr uint32_t STLR_GLOW_COMBA = 0xFFDC143C;  // BBoL COMBA — Combat
constexpr uint32_t STLR_GLOW_ENTRO = 0xFFA0A0A0;  // BBoL ENTRO — Entropy (brightened from #808080)
constexpr uint32_t STLR_GLOW_NOBIL = 0xFFFFD700;  // BBoL NOBIL — Noble
constexpr uint32_t STLR_BASE_VITAL = 0xFFA84A4A;  // PANEL_RED
constexpr uint32_t STLR_BASE_STRUC = 0xFF5A9CB8;  // PANEL_CYAN
constexpr uint32_t STLR_BASE_COSMI = 0xFF7A5A9C;  // PANEL_PURPLE
constexpr uint32_t STLR_BASE_MUTAR = 0xFF7A5A9C;  // PANEL_PURPLE
constexpr uint32_t STLR_BASE_COGNI = 0xFF4A8C6A;  // PANEL_GREEN
constexpr uint32_t STLR_BASE_SOCIA = 0xFF5A9CB8;  // PANEL_CYAN
constexpr uint32_t STLR_BASE_FLUXO = 0xFFB8863A;  // PANEL_ORANGE
constexpr uint32_t STLR_BASE_SENSO = 0xFF9C8C4A;  // PANEL_YELLOW
constexpr uint32_t STLR_BASE_TEMPO = 0xFF7A5A9C;  // PANEL_PURPLE
constexpr uint32_t STLR_BASE_TERRA = 0xFFB8863A;  // PANEL_ORANGE
constexpr uint32_t STLR_BASE_COMBA = 0xFFA84A4A;  // PANEL_RED
constexpr uint32_t STLR_BASE_ENTRO = 0xFF9C8C4A;  // PANEL_YELLOW
constexpr uint32_t STLR_BASE_NOBIL = 0xFF9C8C4A;  // PANEL_YELLOW
constexpr uint32_t STLR_GLOW_VITAL_A = 0x40FF0000;
constexpr uint32_t STLR_GLOW_STRUC_A = 0x400044FF;
constexpr uint32_t STLR_GLOW_COSMI_A = 0x404040B0;
constexpr uint32_t STLR_GLOW_MUTAR_A = 0x408B00FF;
constexpr uint32_t STLR_GLOW_COGNI_A = 0x4000FF00;
constexpr uint32_t STLR_GLOW_SOCIA_A = 0x4000FFFF;
constexpr uint32_t STLR_GLOW_FLUXO_A = 0x40FF8C00;
constexpr uint32_t STLR_GLOW_SENSO_A = 0x40FFFF00;
constexpr uint32_t STLR_GLOW_TEMPO_A = 0x40FF00FF;
constexpr uint32_t STLR_GLOW_TERRA_A = 0x40A0652A;
constexpr uint32_t STLR_GLOW_COMBA_A = 0x40DC143C;
constexpr uint32_t STLR_GLOW_ENTRO_A = 0x40A0A0A0;
constexpr uint32_t STLR_GLOW_NOBIL_A = 0x40FFD700;

// -- 22. SYNTAX HIGHLIGHT (vscDarkPlus — react-syntax-highlighter) --
constexpr uint32_t SYN_DEFAULT = 0xFFD4D4D4;  // default text + operator + punctuation
constexpr uint32_t SYN_KEYWORD = 0xFF569CD6;  // keyword, tag, boolean, doctype-tag
constexpr uint32_t SYN_TYPE = 0xFF4EC9B0;  // class-name, namespace
constexpr uint32_t SYN_STRING = 0xFFCE9178;  // string, char, attr-value, builtin
constexpr uint32_t SYN_NUMBER = 0xFFB5CEA8;  // number, symbol, inserted, unit
constexpr uint32_t SYN_COMMENT = 0xFF6A9955;  // comment, prolog
constexpr uint32_t SYN_FUNCTION = 0xFFDCDCAA;  // function, function.maybe-class-name
constexpr uint32_t SYN_VARIABLE = 0xFF9CDCFE;  // variable, parameter, constant, property, attr-name
constexpr uint32_t SYN_PREPROC = 0xFFC586C0;  // atrule.rule, keyword.module, keyword.control-flow
constexpr uint32_t SYN_REGEX = 0xFFD16969;  // regex literals
constexpr uint32_t SYN_SELECTOR = 0xFFD7BA7D;  // CSS selectors, escape sequences
constexpr uint32_t SYN_PUNCT_MUTED = 0xFF808080;  // tag.punctuation, cdata, html.punctuation

// -- Float helpers for Cairo/GDK (0.0-1.0) --
struct Rgba { double r; double g; double b; double a; };

constexpr Rgba to_rgba(uint32_t argb) {
    return {
        ((argb >> 16) & 0xFF) / 255.0,
        ((argb >>  8) & 0xFF) / 255.0,
        ((argb      ) & 0xFF) / 255.0,
        ((argb >> 24) & 0xFF) / 255.0,
    };
}

}  // namespace ase::colors
