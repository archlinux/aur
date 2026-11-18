#pragma once

/**
 * SHA CONSOLE GENERATED HEADER
 *
 * @file        colors.hpp
 * @brief       Generated colour constants of the SHA design SSOT
 * @description GENERATED from sha-web-styles/src/colors.ts - do not edit.
 *              Regenerate: node sha-web-console/generate-colors.cjs sha-web-styles/src/colors.ts
 *              Any edit made here is lost on the next run; change the source and
 *              run the generator.
 *
 * @module      ase-sha-web-console
 * @layer       5
 * @category    render/ui
 * @usecase     usecase:101331 - wrap terminal lines
 * @created     2026-03-24
 * @modified    2026-10-18
 * @version     1.0.0
 *
 * Copyright (c) Jan Ohlmann. All rights reserved.
 * Licensed to ANTARES SIMULACAO LTDA. Use is governed by LICENSE.md and PJV.md in this repository.
 * SPDX-License-Identifier: LicenseRef-ASE-LIC
 */

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
constexpr uint32_t WIZARD_INFO_BLUE_A = 0x3080C0FF;  // alpha: info blue border
constexpr uint32_t WIZARD_AMBER = 0xFFF59E0B;  // amber: L4 plugin layer color
constexpr uint32_t CURATOR_AGE_FLAG = 0xFF1A0505;  // dark blackish-red: prompt contains minor-indicating terms

// -- 6. TERMINAL COLORS --
constexpr uint32_t TERM_RED = 0xFFCC0000;
constexpr uint32_t TERM_ORANGE = 0xFFFF8800;
constexpr uint32_t TERM_YELLOW = 0xFFFFCC00;
constexpr uint32_t TERM_GREEN = 0xFF00CC00;
constexpr uint32_t TERM_CYAN = 0xFF00CCCC;
constexpr uint32_t TERM_BLUE = 0xFF0088FF;
constexpr uint32_t TERM_PURPLE = 0xFFAA00FF;
constexpr uint32_t TERM_DARK_VIOLET = 0xFF9400D3;
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
constexpr uint32_t LOG_TIER_TRACE = 0xFF767676;  // xterm 243, dark gray
constexpr uint32_t LOG_TIER_DEBUG = 0xFF5F87AF;  // xterm 67, muted blue
constexpr uint32_t LOG_TIER_INFO = 0xFF5FAF5F;  // xterm 71, muted green
constexpr uint32_t LOG_TIER_WARN = 0xFFD7AF5F;  // xterm 179, muted yellow
constexpr uint32_t LOG_TIER_ERROR = 0xFFD75F5F;  // xterm 167, muted red
constexpr uint32_t LOG_TIER_CRITICAL = 0xFFD75F87;  // xterm 168, muted magenta
constexpr uint32_t LOG_TIER_TIMESTAMP = 0xFF6C6C6C;  // xterm 242, timestamp column gray
constexpr uint32_t LOG_TIER_HINT = 0xFF6C6C6C;  // xterm 242, hint line gray
constexpr uint32_t LOG_TIER_CATEGORY = 0xFFD75F5F;  // xterm 167, category name red
constexpr uint32_t CONSOLE_BAND_WORLD = 0xFF0C2210;  // world: green tint
constexpr uint32_t CONSOLE_BAND_ENGINE = 0xFF08182E;  // engine: blue tint, green well under blue
constexpr uint32_t CONSOLE_BAND_REPLICA = 0xFF0A2E2E;  // replica: cyan tint, green equal to blue
constexpr uint32_t CONSOLE_BAND_REASONING = 0xFF1C1430;  // reasoning: purple tint
constexpr uint32_t CONSOLE_BAND_DIST = 0xFF2A1E0C;  // dist: amber tint
constexpr uint32_t CONSOLE_BAND_EDGE = 0xFF2A0C22;  // edge: magenta tint
constexpr uint32_t CONSOLE_BAND_FOOTER = 0xFF242424;  // footer: neutral dark gray, visibly above black
constexpr uint32_t CONSOLE_BAND_ARMED = 0xFF2E0A0A;  // footer armed: dark near-black red
constexpr uint32_t CONSOLE_TREND_GOOD = 0xFF5FAF5F;  // the figure moved the way you want it to
constexpr uint32_t CONSOLE_TREND_BAD = 0xFFD75F5F;  // the figure moved the wrong way
constexpr uint32_t CONSOLE_TREND_FLAT = 0xFF6C6C6C;  // inside the dead band: standing still, said quietly
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
constexpr uint32_t CMS_BRAIN_STAGE = 0xFF05060A;  // brain canvas behind the graph; also the text on an accent fill
constexpr uint32_t CMS_BRAIN_HIT_ACTIVE = 0xFF1B2029;  // brain search result: hovered or selected row
constexpr uint32_t CMS_BRAIN_TOGGLE_BG = 0xFF2A2F3A;  // brain menu: engaged toggle background
constexpr uint32_t CMS_BRAIN_TOGGLE_EDGE = 0xFF7A8598;  // brain menu: engaged toggle outline
constexpr uint32_t CMS_BRAIN_MENU_BG = 0xEB0C0D12;  // brain menu panel over the stage
constexpr uint32_t CMS_BRAIN_FIND_BG = 0xF70A0B0F;  // brain search field over the stage
constexpr uint32_t CMS_BRAIN_MINIMAP_BG = 0xE60A0A0E;  // brain minimap ground
constexpr uint32_t CMS_BRAIN_DROP = 0xBF000000;  // brain floating window drop shadow
constexpr uint32_t CMS_BRAIN_SCRIM = 0x66000000;  // brain scrim behind a drawer
constexpr uint32_t CMS_BRAIN_HIT_RULE = 0x2E737373;  // brain search result separator
constexpr uint32_t CMS_BRAIN_WEIGHT_EDGE = 0x59000000;  // brain result weight mark outline
constexpr uint32_t CMS_BRAIN_OK_WASH = 0x2E4A8C6A;  // brain green wash: accept hover
constexpr uint32_t CMS_BRAIN_WARN_WASH = 0x2EB8863A;  // brain amber wash: engaged ledger row, reject hover
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

// -- 23. GEOID NET — the facts a lattice cell can carry --
constexpr uint32_t GEOID_TRAIL_FRESH = 0xFF1A1AFF;  // walked and lingered on, rung MARK
constexpr uint32_t GEOID_TRAIL_ZONE = 0xFF00CC00;  // the walked cell became something lasting
constexpr uint32_t GEOID_TRAIL_RAISED = 0xFFFF00CC;  // raised out of no man's land, rung not yet named
constexpr uint32_t GEOID_PENTAGON_MARK = 0xFF0088FF;  // the twelve pentagons: geometry, not a state
constexpr uint32_t GEOID_ABSENT_ROW = 0xFF2F4550;  // cells stand, no measurement was delivered
constexpr uint32_t GEOID_SPHERE_SLOT_1 = 0xFFE4678B;  // sphere number 1 (56.6 to the picture)
constexpr uint32_t GEOID_SPHERE_SLOT_2 = 0xFF7D34B2;  // sphere number 2 (46.0)
constexpr uint32_t GEOID_SPHERE_SLOT_3 = 0xFF3CA4DD;  // sphere number 3 (39.9)
constexpr uint32_t GEOID_SPHERE_SLOT_4 = 0xFFD7B975;  // sphere number 4 (38.8)
constexpr uint32_t GEOID_SPHERE_SLOT_5 = 0xFFC91AFF;  // sphere number 5 (37.7)
constexpr uint32_t GEOID_SPHERE_SLOT_6 = 0xFF1A57FF;  // sphere number 6 (35.1)
constexpr uint32_t GEOID_SPHERE_SLOT_7 = 0xFFFF1A5B;  // sphere number 7 (35.0)
constexpr uint32_t GEOID_SPHERE_SLOT_8 = 0xFFD775CF;  // the collection: every sphere number above seven (41.8)

// -- 24. ASE WIKI GRAPH — the three codings of the knowledge window --
constexpr uint32_t WIKI_TRUTH_AKTEUR = 0xFF63713D;  // the actor — the subject above which nothing stands
constexpr uint32_t WIKI_TRUTH_AKTEUR_INK = 0xFFF0F3E7;  // ink on the actor mark — 4.72:1
constexpr uint32_t WIKI_TRUTH_USECASE = 0xFFA98060;  // the use case — which capability carries it
constexpr uint32_t WIKI_TRUTH_USECASE_INK = 0xFF180E06;  // ink on the use case mark — 5.38:1
constexpr uint32_t WIKI_TRUTH_DSGN = 0xFF4A8C6A;  // design decides — the strongest DOCUMENT ground
constexpr uint32_t WIKI_TRUTH_DSGN_INK = 0xFF05100A;  // ink on the design mark — 4.84:1
constexpr uint32_t WIKI_TRUTH_SSOT = 0xFF9C8C4A;  // single source of truth
constexpr uint32_t WIKI_TRUTH_SSOT_INK = 0xFF151105;  // ink on the SSOT mark — 5.62:1
constexpr uint32_t WIKI_TRUTH_CAUSA = 0xFF5A9CB8;  // the reason a thing is as it is
constexpr uint32_t WIKI_TRUTH_CAUSA_INK = 0xFF08151C;  // ink on the causa mark — 6.07:1
constexpr uint32_t WIKI_TRUTH_PLAN = 0xFF7A5A9C;  // what was planned, not yet decided
constexpr uint32_t WIKI_TRUTH_PLAN_INK = 0xFFF0ECFF;  // ink on the plan mark
constexpr uint32_t WIKI_TRUTH_CODE = 0xFF4A5560;  // the code itself — evidence, not authority
constexpr uint32_t WIKI_TRUTH_CODE_INK = 0xFFDFE6EC;  // ink on the code mark
constexpr uint32_t WIKI_TRUTH_COMMENTS = 0xFF1E2A33;  // a comment in the code — weaker than the code
constexpr uint32_t WIKI_TRUTH_COMMENTS_INK = 0xFFB6C2CC;  // ink on the comment mark
constexpr uint32_t WIKI_TRUTH_JRN = 0xFF3DA4A4;  // a journal entry — the LOWEST rung, one session
constexpr uint32_t WIKI_TRUTH_JRN_INK = 0xFF061818;  // ink on the journal mark — 6.12:1
constexpr uint32_t WIKI_TRUTH_EXTERN = 0xFFB8863A;  // a foreign original, outside the order
constexpr uint32_t WIKI_TRUTH_EXTERN_INK = 0xFF1A1200;  // dark ink — the one bright ground
constexpr uint32_t WIKI_TRUTH_UNSOURCED = 0xFFA52222;  // no source at all: a claim, not knowledge
constexpr uint32_t WIKI_TRUTH_UNSOURCED_INK = 0xFFFFECEC;  // ink on the unsourced mark
constexpr uint32_t WIKI_KIND_PAGE = 0xFF5AB8A0;  // a written wiki page
constexpr uint32_t WIKI_KIND_RAW = 0xFF5A9CB8;  // the raw document underneath it
constexpr uint32_t WIKI_KIND_UNIT = 0xFFE0A24A;  // a code unit the knowledge is about
constexpr uint32_t WIKI_KIND_SKILL = 0xFFBE8CF0;  // procedural knowledge — a skill
constexpr uint32_t WIKI_KIND_CLUSTER = 0xFF8E99A8;  // the head of a cluster, not a document
constexpr uint32_t WIKI_KIND_ROOT = 0xFFF5F8FB;  // the one root: ASE itself
constexpr uint32_t WIKI_KIND_ACTOR = 0xFFF3168C;  // who acts — an actor in a use case
constexpr uint32_t WIKI_KIND_USECASE = 0xFFA9F316;  // what is done — the oval between actors
constexpr uint32_t WIKI_KIND_KK = 0xFFE23C12;  // the manuscript module a chapter grew from
constexpr uint32_t WIKI_KIND_MODULE = 0xFF16F3B8;  // what it sits in — a package
constexpr uint32_t WIKI_KIND_DIAGRAM = 0xFF475EF5;  // where it was drawn — one EA sheet
constexpr uint32_t WIKI_KIND_CLASS = 0xFFCE3BBA;  // a class of the design model
constexpr uint32_t WIKI_KIND_NOTE = 0xFF7E29E0;  // a note pinned to an element
constexpr uint32_t WIKI_KIND_DSGN = 0xFFD4667A;  // the rarer design entities, together
constexpr uint32_t WIKI_KIND_SESSION = 0xFF3A4A88;  // who worked — one session over the stock
constexpr uint32_t WIKI_KIND_TERM = 0xFFECD613;  // which word — the vocabulary a page uses
constexpr uint32_t WIKI_KIND_SCRIPT = 0xFFEC134D;  // which tool produced it
constexpr uint32_t WIKI_KIND_ORIGIN = 0xFFE513EC;  // where it was carried over from
constexpr uint32_t WIKI_DOM_NONE = 0xFF6B7280;  // carries no domain — an answer, not a fallback
constexpr uint32_t WIKI_DEPTH_1 = 0xFF207971;  // 4 … 6 chunks
constexpr uint32_t WIKI_DEPTH_2 = 0xFF2C8BA5;  // 7 … 8
constexpr uint32_t WIKI_DEPTH_3 = 0xFF3E82CC;  // 9 … 11
constexpr uint32_t WIKI_DEPTH_4 = 0xFF6A7ED7;  // 12 … 14
constexpr uint32_t WIKI_DEPTH_5 = 0xFF9F96E3;  // 15 and up — the long tail to 66
constexpr uint32_t WIKI_SPAN_1 = 0xFF5E6597;  // 2 rungs — headroom below the measured range
constexpr uint32_t WIKI_SPAN_2 = 0xFF3C81B0;  // 3 — actor · use case · code, and nothing between
constexpr uint32_t WIKI_SPAN_3 = 0xFF059CB9;  // 4 — the commonest: one document rung carries it
constexpr uint32_t WIKI_SPAN_4 = 0xFF2EB4B1;  // 5
constexpr uint32_t WIKI_SPAN_5 = 0xFF6FC8A0;  // 6 — the measured maximum, 3 pages
constexpr uint32_t WIKI_SPAN_6 = 0xFFB0D891;  // 7 and up — headroom above
constexpr uint32_t WIKI_SESS_1 = 0xFF913812;  // filed with 1 … 14 others — a quiet session
constexpr uint32_t WIKI_SESS_2 = 0xFFBA4817;  // 15 … 44
constexpr uint32_t WIKI_SESS_3 = 0xFFE3581C;  // 45 … 53
constexpr uint32_t WIKI_SESS_4 = 0xFFE87645;  // 54 and up — the measured maximum is 76
constexpr uint32_t WIKI_RUNG_ARCH = 0xFFD194B2;  // ARCH — the SSOT, what is built
constexpr uint32_t WIKI_RUNG_CAUSA = 0xFFCB9287;  // CAUSA — why it is built that way
constexpr uint32_t WIKI_RUNG_INST = 0xFFC6B979;  // INST — how it is done
constexpr uint32_t WIKI_RUNG_WRFL = 0xFF96C06C;  // WRFL — in which order
constexpr uint32_t WIKI_RUNG_PLAN = 0xFF5EBA6E;  // PLAN — what is planned next
constexpr uint32_t WIKI_DOC_ASIDE = 0xFFA08B76;  // MIG, TASK, REF, SEARCH, …
constexpr uint32_t WIKI_EDGE_LINK = 0x4DE05A6E;  // refers to
constexpr uint32_t WIKI_EDGE_PROVENANCE = 0x73E0BE6E;  // rests on as evidence
constexpr uint32_t WIKI_EDGE_CLUSTER = 0x4D78C896;  // hangs under this design
constexpr uint32_t WIKI_EDGE_ROOT = 0x38F0F4F8;  // design belongs to ASE
constexpr uint32_t WIKI_EDGE_ASSOCIATION = 0x8CBE8CF0;  // read together, repeatedly
constexpr uint32_t WIKI_ERA_LEGACY = 0xFF9C7A58;  // 2015/16 — the aged bronze of the oldest stratum
constexpr uint32_t WIKI_ERA_LEGACY_INK = 0xFF120C05;  // dark ink on bronze — 4.94:1
constexpr uint32_t WIKI_ERA_DESIGN = 0xFF7878B0;  // the manuscript era, between then and now
constexpr uint32_t WIKI_ERA_DESIGN_INK = 0xFF08081A;  // dark ink on the manuscript mark
constexpr uint32_t WIKI_ERA_DSGN = 0xFF4A9C8C;  // the curated chapters of today
constexpr uint32_t WIKI_ERA_DSGN_INK = 0xFF04120F;  // dark ink on the chapter mark
constexpr uint32_t WIKI_ERA_WIKI = 0xFFA8C4D8;  // the second brain — the newest and palest layer
constexpr uint32_t WIKI_ERA_WIKI_INK = 0xFF0A1620;  // dark ink on the brightest ground
constexpr uint32_t WIKI_CLUSTER_SEAT_1 = 0xFF5A9CB8;  // first cluster in the wheel
constexpr uint32_t WIKI_CLUSTER_SEAT_2 = 0xFF4A8C6A;  // second
constexpr uint32_t WIKI_CLUSTER_SEAT_3 = 0xFFB8863A;  // third
constexpr uint32_t WIKI_CLUSTER_SEAT_4 = 0xFF7A5A9C;  // fourth
constexpr uint32_t WIKI_CLUSTER_SEAT_5 = 0xFFA84A4A;  // fifth
constexpr uint32_t WIKI_CLUSTER_SEAT_6 = 0xFF9C8C4A;  // sixth, then the wheel turns over
constexpr uint32_t WIKI_CLUSTER_ROOT = 0xFFF0F4F8;  // the one root, ASE itself
constexpr uint32_t WIKI_CLUSTER_WIKI = 0xFFE05A6E;  // the wiki cloud at the centre
constexpr uint32_t WIKI_UNIT_UNKNOWN = 0xFFC9CFD8;  // tier not in the register
constexpr uint32_t WIKI_MARK_SELECTED = 0xF2F5F7FC;  // ring around the selected point
constexpr uint32_t WIKI_MARK_NEIGHBOUR = 0x8CDAE0EC;  // ring around its neighbours
constexpr uint32_t WIKI_MARK_NEIGHBOUR_LINE = 0x47C8CDD7;
constexpr uint32_t WIKI_MARK_HOVER_EDGE = 0xBFFFDCA0;  // edges from the hovered point
constexpr uint32_t WIKI_MARK_HOVER_SOFT = 0x99FFDCA0;  // the same, one step back
constexpr uint32_t WIKI_MARK_HUB_EDGE = 0xFF969EAC;  // hub graph — consumers apply their own opacity
constexpr uint32_t WIKI_MARK_HUB_FOCUS = 0x8CC8D2E1;  // hub edge in focus
constexpr uint32_t WIKI_MARK_ORBIT = 0x2196A0B2;  // the ring layout's orbit circles
constexpr uint32_t WIKI_MARK_NODE_RING = 0xB3C8CDD7;  // outline of a page node
constexpr uint32_t WIKI_MARK_NODE_FAINT = 0x47C8CDD7;  // outline, unselected
constexpr uint32_t WIKI_MARK_CONFLICT = 0xFFB8863A;  // a page with open contradictions
constexpr uint32_t WIKI_MARK_UNSOURCED = 0xFFE06C6C;  // chip: no design chapter at all
constexpr uint32_t WIKI_MARK_DSGN_CHIP = 0xFF2A4D63;  // chip ground for a design chapter
constexpr uint32_t WIKI_LABEL_HUB = 0xEBE6E8EE;  // hub name
constexpr uint32_t WIKI_LABEL_FILE = 0xCCC8CBD2;  // file name at close zoom
constexpr uint32_t WIKI_LABEL_SHADOW = 0xCC000000;  // outline behind a hub name
constexpr uint32_t WIKI_LABEL_SHADOW_2 = 0xBF000000;  // the same for file names
constexpr uint32_t WIKI_TOOLTIP_GROUND = 0xD905060A;  // ground behind the ring labels
constexpr uint32_t WIKI_MINIMAP_FRAME = 0x99FFFFFF;  // the viewport rectangle
constexpr uint32_t WIKI_MINIMAP_WIKI = 0xF2E05A6E;  // the wiki cloud in the minimap
constexpr uint32_t WIKI_MARK_STALE = 0xB3C8CDD7;  // dashed ring: decaying
constexpr uint32_t WIKI_MARK_HOLLOW = 0xD905060A;  // dark core: unverified
constexpr uint32_t WIKI_MARK_GLOW_CORE = 0xF2FFFFFF;  // hot centre of the glow
constexpr uint32_t WIKI_MARK_SPEC = 0xE6FFFFFF;  // highlight on a sphere
constexpr uint32_t WIKI_MARK_SPEC_EDGE = 0x00FFFFFF;  // where that highlight dies out
constexpr uint32_t WIKI_MARK_MIX_NULL = 0xFF000000;  // mix zero: the colour, untinted
constexpr uint32_t WIKI_UNIT_FOUNDATION = 0xFFE06A3A;  // L0 — foundation, no ECS
constexpr uint32_t WIKI_UNIT_CORE = 0xFF9C8C4A;  // L1 — core
constexpr uint32_t WIKI_UNIT_KERNEL = 0xFFD4547A;  // L2 — kernel
constexpr uint32_t WIKI_UNIT_MODULES = 0xFF5AB8A0;  // L3 — modules
constexpr uint32_t WIKI_UNIT_PLUGINS = 0xFFC9CFD8;  // L4 — hot-loadable plugins
constexpr uint32_t WIKI_UNIT_SERVERS = 0xFFB8863A;  // L5 — servers
constexpr uint32_t WIKI_UNIT_CLIENTS = 0xFF5A9CB8;  // L5 — clients
constexpr uint32_t WIKI_UNIT_TOOLS = 0xFF7A5A9C;  // tooling beside the layer system
constexpr uint32_t WIKI_VIEW_GROUND = 0xFF0B0E11;  // the canvas behind everything
constexpr uint32_t WIKI_VIEW_PANEL = 0xF00A0E12;  // detail panel, over the canvas
constexpr uint32_t WIKI_VIEW_CONTROL = 0xFF141B21;  // input fields
constexpr uint32_t WIKI_VIEW_ACTIVE = 0xFF1C2833;  // the chosen coding button
constexpr uint32_t WIKI_VIEW_ALARM = 0xEB781414;  // the error box — unmissable
constexpr uint32_t WIKI_VIEW_ALARM_INK = 0xFFFFECEC;  // ink on the alarm
constexpr uint32_t WIKI_VIEW_TEXT = 0xFFE6EEF4;  // titles — read first
constexpr uint32_t WIKI_VIEW_BODY = 0xFFC8D4DC;  // body text
constexpr uint32_t WIKI_VIEW_MUTED = 0xFFB8C6D0;  // values in the detail list
constexpr uint32_t WIKI_VIEW_LABEL = 0xFF8C9BA6;  // legend and field labels
constexpr uint32_t WIKI_VIEW_FAINT = 0xFF6E808D;  // ids, timestamps — present, not loud
constexpr uint32_t WIKI_VIEW_INACTIVE = 0xFF7D8F9C;  // an unchosen control
constexpr uint32_t WIKI_VIEW_QUIET = 0xFF9FB4C2;  // a secondary button
constexpr uint32_t WIKI_VIEW_EDGE = 0x1FFFFFFF;  // control borders
constexpr uint32_t WIKI_VIEW_SEAM = 0x14FFFFFF;  // panel seam
constexpr uint32_t WIKI_VIEW_HAIRLINE = 0x0DFFFFFF;  // list separators

// -- 25. DOMAIN CODE --
constexpr uint32_t DOMAIN_WATER = 0xFF4FC3F7;  // water: pouring, soil moisture, rain, held water
constexpr uint32_t DOMAIN_FLOW = 0xFF26C6A6;  // air and flow: wind, current, sap
constexpr uint32_t DOMAIN_LIFE = 0xFFA5D65A;  // life: growth, leaf, the living plant
constexpr uint32_t DOMAIN_GROUND = 0xFFC9A06A;  // ground: soil, terrain, the tool place
constexpr uint32_t DOMAIN_CUT = 0xFFFF7A45;  // cut: pruning, a wound, a blade
constexpr uint32_t DOMAIN_TIME = 0xFFB48CFF;  // time: calendar, hourglass, forecast
constexpr uint32_t DOMAIN_SKY = 0xFF9FB4FF;  // sky: weather, light, the sky band
constexpr uint32_t DOMAIN_ALERT = 0xFFE53935;  // need: the living thing is in danger, an action is refused
constexpr uint32_t SEASON_GLACIX = 0xFF9FB4FF;  // GLACIX, LUNBREX 13 and 1 to 3: the sky's hue, the frozen flora
constexpr uint32_t SEASON_SALTATRIX = 0xFFA5D65A;  // SALTATRIX, LUNBREX 4 to 6: the hue of life, the flush of leaves
constexpr uint32_t SEASON_IGNIX = 0xFFFF7A45;  // IGNIX, LUNBREX 7 to 9: the hue of the cut, the full light
constexpr uint32_t SEASON_HALITRIX = 0xFFC9A06A;  // HALITRIX, LUNBREX 10 to 12: the ground's hue, the leaf fall
constexpr uint32_t DOMAIN_WATER_HELD = 0x6B4FC3F7;  // water held: fill arc of a vessel, wet top of the root cut
constexpr uint32_t DOMAIN_WATER_DEEP = 0x2E4FC3F7;  // the wet floor of the root cut
constexpr uint32_t DOMAIN_WATER_RIM = 0x804FC3F7;  // outline of the root cut
constexpr uint32_t DOMAIN_GROUND_GRID = 0x38C9A06A;  // terrain grid across the slope lines
constexpr uint32_t DOMAIN_GROUND_CONTOUR_NEAR = 0x2EC9A06A;  // slope line at the near edge; linear in depth to the far one
constexpr uint32_t DOMAIN_GROUND_CONTOUR_FAR = 0x7AC9A06A;  // slope line at the far edge
constexpr uint32_t DOMAIN_GROUND_BRUSH = 0x24C9A06A;  // the area a terrain tool works on
constexpr uint32_t DOMAIN_GROUND_PATCH = 0x1FC9A06A;  // the whole patch a levelling covers
constexpr uint32_t DOMAIN_ALERT_ROOT_ZONE = 0xD9E53935;  // dashed ring of the root zone a terrain tool must not enter
constexpr uint32_t DOMAIN_ALERT_HOLD = 0x0FE53935;  // ground of the hold button that opens the system ring
constexpr uint32_t DOMAIN_TIME_CHIP_ON = 0x42B48CFF;  // a chosen forecast chip
constexpr uint32_t SAP_HELD = 0x8C26C6A6;  // birch sap standing in a bark vessel
constexpr uint32_t SAP_DROP = 0xE68CE6D2;  // a sap drop falling from the tap hole
constexpr uint32_t OVERLAY_INK = 0xE6F0F6F7;  // text and lines that must be read
constexpr uint32_t OVERLAY_INK_SOFT = 0x94F0F6F7;  // secondary text, an unchosen symbol
constexpr uint32_t OVERLAY_INK_FAINT = 0x4DF0F6F7;  // rails, guides, hairlines
constexpr uint32_t OVERLAY_INK_LEVEL = 0x99F0F6F7;  // fill of the device charge mark
constexpr uint32_t OVERLAY_INK_FRAME = 0x80F0F6F7;  // outline of the device charge mark
constexpr uint32_t OVERLAY_SHADOW = 0x8C000000;  // halo under text and hexes, shadow under a thing, foot of the screen
constexpr uint32_t OVERLAY_SHADOW_LIFTED = 0x99000000;  // shadow under a thing being dragged
constexpr uint32_t OVERLAY_CLEAR = 0x00000000;  // where a scrim fades out
constexpr uint32_t OVERLAY_SCRIM_TOP = 0x80000000;  // head of the screen behind the sky band
constexpr uint32_t OVERLAY_VIGNETTE = 0x73000000;  // the dark corner of the screen vignette
constexpr uint32_t OVERLAY_CHIP_OFF = 0x9E060A0C;  // a hex chip not chosen
constexpr uint32_t OVERLAY_ITEM_CHIP_OFF = 0xA8060A0C;  // a hex chip carrying a thing, not chosen
constexpr uint32_t OVERLAY_DISC = 0x99060A0C;  // ground of a sign marker, a prune mark, an unchosen forecast chip
constexpr uint32_t OVERLAY_BAG_DISC = 0x8C060A0C;  // ground of the bag button
constexpr uint32_t OVERLAY_HAND_EMPTY = 0x66060A0C;  // the hand slot with nothing in it
constexpr uint32_t OVERLAY_FOCUS_DISC = 0x40060A0C;  // ground of the focus ring
constexpr uint32_t OVERLAY_DOT_DARK = 0xFF0A0E10;  // the dark dot: the chosen sign on the rail, an unchosen phase of the day chain
constexpr uint32_t OVERLAY_SLOT_FRAME = 0x0FFFFFFF;  // frame of a place inside a bag
constexpr uint32_t OVERLAY_SCRIM_RACK = 0x99040709;  // behind the large tool place
constexpr uint32_t OVERLAY_SCRIM_TRAIL = 0x9E040709;  // behind the trail on arrival
constexpr uint32_t OVERLAY_SCRIM_SKY = 0xCC04070C;  // behind the calendar sheet
constexpr uint32_t OVERLAY_SCRIM_SYSTEM = 0xC7060404;  // behind the system ring
constexpr uint32_t WORLD_THING_SHADOW = 0x40000000;  // under a thing lying on the ground
constexpr uint32_t PLANT_SHADE = 0x38000000;  // the shade ellipse under the birch from the shoot on
constexpr uint32_t PLANT_SEED_MOUND = 0xE646341E;  // the earth mound over the sown seed
constexpr uint32_t PLANT_SEED = 0xF2CDB482;  // the seed showing on its mound
constexpr uint32_t WORLD_RACK_SHADOW = 0x47000000;  // under the tool place
constexpr uint32_t WORLD_RACK_BAR = 0xFF7A5A36;  // crossbar of the tool place; its stakes wear MATERIAL_WOOD_DARK
constexpr uint32_t WORLD_DIBBER_HOLE = 0xE61C140C;  // the hole the dibber leaves until the seed closes it
constexpr uint32_t ROOT_CUT_SOIL_TOP = 0xF53A2A1A;  // soil at the top of the root cut
constexpr uint32_t ROOT_CUT_SOIL_DEEP = 0xF51E160E;  // soil at the floor of the root cut
constexpr uint32_t ROOT_CUT_ROOT = 0x8CECE2CE;  // the roots drawn into the cut
constexpr uint32_t WEATHER_RAIN = 0x59C8DCF0;  // a rain streak falling through the scene
constexpr uint32_t WEATHER_DRIZZLE = 0x52D2E1F0;  // a drizzle fleck
constexpr uint32_t WEATHER_SNOW = 0xD9F5F8FC;  // a snowflake
constexpr uint32_t WEATHER_FOG = 0x42C8CED4;  // the middle of a fog band
constexpr uint32_t WEATHER_FOG_CLEAR = 0x00C8CED4;  // the edges of a fog band, the fog hue faded out
constexpr uint32_t WEATHER_CLOUD = 0x473C424A;  // a cloud bank drifting across an overcast sky
constexpr uint32_t WEATHER_CLOUD_SNOW = 0x47C8CDD4;  // a cloud bank of a snowy sky
constexpr uint32_t SKY_CLEAR_NIGHT_ZENITH = 0xFF050810;  // the sky high up on a night (m.html skyCols)
constexpr uint32_t SKY_CLEAR_NIGHT_HORIZON = 0xFF0D1322;  // the horizon on a night
constexpr uint32_t SKY_CLEAR_DAWN_ZENITH = 0xFF2C2044;  // the sky high up at dawn and dusk
constexpr uint32_t SKY_CLEAR_DAWN_HORIZON = 0xFFD46C48;  // the horizon at dawn and dusk
constexpr uint32_t SKY_CLEAR_DAY_ZENITH = 0xFF3C6CA8;  // the sky high up by day
constexpr uint32_t SKY_CLEAR_DAY_HORIZON = 0xFFA8C6DC;  // the horizon by day
constexpr uint32_t SKY_OVERCAST_DAY_ZENITH = 0xFF464E58;  // the zenith grey of an overcast day
constexpr uint32_t SKY_OVERCAST_DAY_HORIZON = 0xFF788088;  // the horizon grey of an overcast day
constexpr uint32_t SKY_OVERCAST_NIGHT_ZENITH = 0xFF14181E;  // the zenith grey of an overcast night
constexpr uint32_t SKY_OVERCAST_NIGHT_HORIZON = 0xFF1E2228;  // the horizon grey of an overcast night
constexpr uint32_t SKY_OVERCAST_SUN = 0x59FFD2BE;  // the sun's disc behind clouds
constexpr uint32_t SKY_SUN_HALO = 0xFFFF9664;  // the warm core of the sun's halo; its opacity is sky-clear-sun-halo or sky-overcast-sun-halo
constexpr uint32_t SKY_SUN_HALO_EDGE = 0x00FF7850;  // the rim of the sun's halo, faded out
constexpr uint32_t SKY_RIDGE_TONE = 0xFF1C241E;  // the dark green the hills on the horizon turn toward, by sky-ridge-far-share and sky-ridge-near-share
constexpr uint32_t GROUND_SEASON_GLACIX = 0xFFD6DCE2;  // the ground in GLACIX: frost over the cover (m.html groundCol)
constexpr uint32_t GROUND_SEASON_SALTATRIX = 0xFF587638;  // the ground in SALTATRIX: the fresh green of the flush
constexpr uint32_t GROUND_SEASON_IGNIX = 0xFF4A642C;  // the ground in IGNIX: the deep green of full light
constexpr uint32_t GROUND_SEASON_HALITRIX = 0xFF846C38;  // the ground in HALITRIX: the brown of the leaf fall
constexpr uint32_t GROUND_SNOW = 0xFFE2E6EC;  // the white the ground turns toward while it snows, by ground-snow-share
constexpr uint32_t LEAF_SEASON_GLACIX = 0x00000000;  // the leaf in GLACIX: none, the birch stands bare (m.html leafCol); alpha 0 lays no colour over a leaf
constexpr uint32_t LEAF_SEASON_SALTATRIX = 0xFF9CCE5C;  // the leaf in SALTATRIX: the light green of the flush (m.html leafCol)
constexpr uint32_t LEAF_SEASON_IGNIX = 0xFF60983A;  // the leaf in IGNIX: the deep green of full light
constexpr uint32_t LEAF_SEASON_HALITRIX = 0xFFD6A83A;  // the leaf in HALITRIX: the gold before the fall
constexpr uint32_t LEAF_DRY = 0xFF847C42;  // the olive a leaf turns toward while its stand wilts, by leaf-dry-share
constexpr uint32_t BROOK_TONE_FAR = 0xFF285A78;  // the water's own tone at the brook's far reach, mixed into the reflected horizon by brook-tone-far-share
constexpr uint32_t BROOK_TONE_NEAR = 0xFF143246;  // the water's own tone at the brook's near reach, mixed into the reflected sky by brook-tone-near-share
constexpr uint32_t BROOK_STREAK = 0x40DCF0FF;  // the light strokes of the current along the brook (m.html drawWater)
constexpr uint32_t BELT_STRAP = 0x998C5B34;  // the belt across the foot of the screen
constexpr uint32_t BELT_STRAP_SHADE = 0x991E1208;  // the shaded edge of the belt
constexpr uint32_t HOLSTER_GROUND = 0x804A2E18;  // a holster on the belt
constexpr uint32_t HOLSTER_EDGE = 0xB3C9A06A;  // edge of a holster that holds a thing
constexpr uint32_t LEATHER_BAG_FLAP = 0xFF4A2E18;  // flap of the leather pack
constexpr uint32_t LEATHER_BAG_EDGE = 0xFF2A190B;  // outline of flap and body
constexpr uint32_t LEATHER_BAG_SEAM = 0x66C9A06A;  // stitched seam on the flap
constexpr uint32_t LEATHER_BAG_BODY = 0xF55C3A20;  // body of the open pack
constexpr uint32_t LEATHER_BAG_INNER = 0x801A0F07;  // the inside where things lie
constexpr uint32_t LEATHER_BAG_INNER_SEAM = 0x61C9A06A;  // seam around the inside
constexpr uint32_t LEATHER_BAG_TITLE = 0xFFE8D3B0;  // title, close symbol and the names of the things inside
constexpr uint32_t LEATHER_BAG_LOAD = 0xBFE8D3B0;  // weight and volume carried
constexpr uint32_t LEATHER_BAG_SPEC = 0x80E8D3B0;  // mouth width and container kind
constexpr uint32_t LINEN_POUCH_BODY = 0xF7D9CFB6;  // body of the open linen pouch
constexpr uint32_t LINEN_POUCH_EDGE = 0xFF8F866F;  // outline of the pouch
constexpr uint32_t LINEN_POUCH_FOLD = 0x808F866F;  // the fold down its side
constexpr uint32_t LINEN_POUCH_STRING = 0xFF8C5B34;  // the drawstring
constexpr uint32_t LINEN_POUCH_TITLE = 0xFFF0E6D0;  // title and close symbol
constexpr uint32_t LINEN_POUCH_INK = 0xFF4A3F2C;  // the names of the things inside
constexpr uint32_t MATERIAL_WOOD = 0xFFB58B5B;  // a handle, a shaft, a peg
constexpr uint32_t MATERIAL_WOOD_DARK = 0xFF5E4428;  // grain and outline of wood
constexpr uint32_t MATERIAL_IRON = 0xFFA9B3B7;  // a blade, a spade, a hoe
constexpr uint32_t MATERIAL_IRON_DARK = 0xFF59646A;  // edge and outline of iron
constexpr uint32_t MATERIAL_CLAY = 0xFFC67B55;  // the watering pot
constexpr uint32_t MATERIAL_CLAY_DARK = 0xFF7D4A30;  // outline and spout of clay
constexpr uint32_t MATERIAL_LINEN = 0xFFD9CFB6;  // the linen pouch as a thing
constexpr uint32_t MATERIAL_LINEN_DARK = 0xFF8F866F;  // outline of linen
constexpr uint32_t MATERIAL_LEATHER = 0xFF8C5B34;  // the leather pack as a thing, its strap
constexpr uint32_t MATERIAL_LEATHER_DARK = 0xFF4A2E18;  // flap of leather
constexpr uint32_t MATERIAL_LEATHER_EDGE = 0xFF5C3A20;  // outline of the leather pack
constexpr uint32_t MATERIAL_LEATHER_SEAM = 0xFF744A29;  // the seam along its flap
constexpr uint32_t MATERIAL_BARK = 0xFFEDE8DC;  // birch bark of the vessel
constexpr uint32_t MATERIAL_BARK_EDGE = 0xFF9C9484;  // outline of the bark vessel
constexpr uint32_t MATERIAL_CHAR = 0xFF2E241A;  // dark marks on bark and pith
constexpr uint32_t MATERIAL_PITH = 0xFFCDB98F;  // the pushed-out pith of an elder spout
constexpr uint32_t MATERIAL_ELDER_EDGE = 0xFF8A7650;  // outline of an elder spout
constexpr uint32_t MATERIAL_PALE = 0xFFD8C9A8;  // pale wood, a peg head
constexpr uint32_t MATERIAL_SEED = 0xFFCDB184;  // a seed
constexpr uint32_t MATERIAL_SEED_EDGE = 0xFF7A6040;  // outline of a seed
constexpr uint32_t MATERIAL_SEED_HILUM = 0xFF6D5232;  // the eye of a seed
constexpr uint32_t DEBUG_INK = 0xFF8A9A9A;  // every debug text and symbol: TEXT_PRIMARY
constexpr uint32_t DEBUG_INK_ON = 0xFFC0C0C0;  // the label of a chosen debug chip: TEXT_PANEL_WHITE
constexpr uint32_t DEBUG_LINE = 0x80737373;  // outline of chips, handle, fields, the drawer line: BORDER_A50
constexpr uint32_t DEBUG_GROUND = 0xFF303030;  // ground of a chosen debug chip and of the drawer handle: SURFACE_5_SELECT
constexpr uint32_t DEBUG_CHIP_OFF = 0xFF121212;  // a debug chip not chosen: SURFACE_2
constexpr uint32_t DEBUG_BUTTON_ON = 0xFF303030;  // the debug button while debug is on: SURFACE_5_SELECT
constexpr uint32_t DEBUG_DRAWER = 0xF2040404;  // the open debug drawer: SURFACE_0_PANEL
constexpr uint32_t DEBUG_FIELD = 0xFF0A0A0A;  // a value field inside the drawer: SURFACE_1
constexpr uint32_t FIGURE_INK = 0xFFE6EDEF;  // the head title
constexpr uint32_t FIGURE_HEAD_BAR = 0x59060A0C;  // the bar across the head of the screen
constexpr uint32_t FIGURE_STICK_GROUND = 0x47060A0C;  // the ring of the stick while the thumb holds it
constexpr uint32_t FIGURE_STICK_RING = 0x73E6EDEF;  // outline of that ring
constexpr uint32_t FIGURE_STICK_KNOB = 0x8CE6EDEF;  // the knob under the thumb
constexpr uint32_t FIGURE_STICK_REST = 0x59E6EDEF;  // the dashed ring where the stick rests
constexpr uint32_t FIGURE_STICK_REST_LABEL = 0xB3E6EDEF;  // the word inside the resting ring
constexpr uint32_t FIGURE_ZONE_STICK = 0x40FFB300;  // dashed frame of the stick half
constexpr uint32_t FIGURE_ZONE_STICK_LABEL = 0xB3FFB300;  // the name of the stick half
constexpr uint32_t FIGURE_ZONE_ORBIT = 0x339FB4FF;  // dashed frame of the orbit half
constexpr uint32_t FIGURE_ZONE_ORBIT_LABEL = 0xB39FB4FF;  // the name of the orbit half
constexpr uint32_t FIGURE_AREA_EDGE = 0xFFFFB300;  // the warning that the figure stands at the edge of its area
constexpr uint32_t FIGURE_SWITCH_GROUND = 0x3326C6A6;  // the hexagon of cam.mode while the player camera stands
constexpr uint32_t FIGURE_RAIL = 0x59E6EDEF;  // the zoom rail, the comb's leader and the spine
constexpr uint32_t FIGURE_SOUL_LABEL = 0xFF5D6E73;  // the word SEELE over the spine's end

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
