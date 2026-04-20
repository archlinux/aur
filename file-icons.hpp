// @generated from icon-definitions.ts + icon-replacer.ts + colors.ts — DO NOT EDIT
// Regenerate: node sha-web-console/generate-file-icons.cjs
#pragma once

#include <cstdint>

namespace ase::file_icons {

struct FileIcon {
    const char* pattern;    // ".cpp" (extension) or "CMakeLists.txt" (exact name)
    char32_t    glyph;      // NerdFont Unicode codepoint
    uint32_t    color;      // 0xAARRGGBB
    bool        exact_name; // true = match full filename, false = match extension
};

// -- Extension-based icons (69 entries) --
constexpr FileIcon EXT_ICONS[] = {
    {".cpp", U'\xE61D', 0xFF5A9CB8, false},
    {".cxx", U'\xE61D', 0xFF5A9CB8, false},
    {".cc", U'\xE61D', 0xFF5A9CB8, false},
    {".hpp", U'\xE61D', 0xFF7A5A9C, false},
    {".hxx", U'\xE61D', 0xFF7A5A9C, false},
    {".h", U'\xE61E', 0xFF7A5A9C, false},
    {".c", U'\xE61E', 0xFF5A9CB8, false},
    {".inl", U'\xE61D', 0xFF7A5A9C, false},
    {".ts", U'\xE8CA', 0xFF5A9CB8, false},
    {".tsx", U'\xE7BA', 0xFF5A9CB8, false},
    {".js", U'\xE781', 0xFF9C8C4A, false},
    {".jsx", U'\xE7BA', 0xFF9C8C4A, false},
    {".mjs", U'\xE781', 0xFF9C8C4A, false},
    {".cjs", U'\xE781', 0xFF9C8C4A, false},
    {".py", U'\xE73C', 0xFF4A8C6A, false},
    {".rs", U'\xE7A8', 0xFFB8863A, false},
    {".go", U'\xE724', 0xFF5A9CB8, false},
    {".java", U'\xE738', 0xFFA84A4A, false},
    {".kt", U'\xE81B', 0xFF7A5A9C, false},
    {".swift", U'\xE755', 0xFFB8863A, false},
    {".rb", U'\xE739', 0xFFA84A4A, false},
    {".php", U'\xE73D', 0xFF7A5A9C, false},
    {".lua", U'\xF121', 0xFF5A9CB8, false},
    {".html", U'\xF121', 0xFFB8863A, false},
    {".css", U'\xF13C', 0xFF5A9CB8, false},
    {".scss", U'\xF13C', 0xFF7A5A9C, false},
    {".less", U'\xF13C', 0xFF7A5A9C, false},
    {".svg", U'\xF03E', 0xFF9C8C4A, false},
    {".json", U'\xF085', 0xFF9C8C4A, false},
    {".yaml", U'\xF1DE', 0xFF7A5A9C, false},
    {".yml", U'\xF1DE', 0xFF7A5A9C, false},
    {".toml", U'\xF085', 0xFFB8863A, false},
    {".xml", U'\xF121', 0xFFB8863A, false},
    {".ini", U'\xF1DE', 0xFF9C8C4A, false},
    {".env", U'\xF023', 0xFFA84A4A, false},
    {".csv", U'\xF0CE', 0xFF4A8C6A, false},
    {".md", U'\xF15C', 0xFF8A9A9A, false},
    {".txt", U'\xF0F6', 0xFF6A7A7A, false},
    {".rst", U'\xF15C', 0xFF8A9A9A, false},
    {".pdf", U'\xF1C1', 0xFFA84A4A, false},
    {".sh", U'\xE795', 0xFF4A8C6A, false},
    {".bash", U'\xE795', 0xFF4A8C6A, false},
    {".zsh", U'\xE795', 0xFF4A8C6A, false},
    {".fish", U'\xE795', 0xFF4A8C6A, false},
    {".cmake", U'\xEEFF', 0xFF4A8C6A, false},
    {".mk", U'\xEEFF', 0xFF4A8C6A, false},
    {".ninja", U'\xEEFF', 0xFFB8863A, false},
    {".png", U'\xF03E', 0xFF7A5A9C, false},
    {".jpg", U'\xF03E', 0xFF7A5A9C, false},
    {".jpeg", U'\xF03E', 0xFF7A5A9C, false},
    {".gif", U'\xF03E', 0xFF7A5A9C, false},
    {".webp", U'\xF03E', 0xFF7A5A9C, false},
    {".ico", U'\xF03E', 0xFF7A5A9C, false},
    {".bmp", U'\xF03E', 0xFF7A5A9C, false},
    {".zip", U'\xF1C6', 0xFFB8863A, false},
    {".tar", U'\xF1C6', 0xFFB8863A, false},
    {".gz", U'\xF1C6', 0xFFB8863A, false},
    {".xz", U'\xF1C6', 0xFFB8863A, false},
    {".7z", U'\xF1C6', 0xFFB8863A, false},
    {".glsl", U'\xF0E7', 0xFF9C8C4A, false},
    {".vert", U'\xF0E7', 0xFF5A9CB8, false},
    {".frag", U'\xF0E7', 0xFFB8863A, false},
    {".spv", U'\xF0E7', 0xFF7A5A9C, false},
    {".wgsl", U'\xF0E7', 0xFF4A8C6A, false},
    {".sql", U'\xF1C0', 0xFF5A9CB8, false},
    {".lock", U'\xF023', 0xFF4A4A4A, false},
    {".wasm", U'\xF1B2', 0xFF7A5A9C, false},
    {".proto", U'\xF0EC', 0xFF5A9CB8, false},
    {".log", U'\xF0F6', 0xFF4A4A4A, false},
};
constexpr int EXT_ICONS_COUNT = 69;

// -- Exact filename icons (21 entries) --
constexpr FileIcon NAME_ICONS[] = {
    {"CMakeLists.txt", U'\xEEFF', 0xFF4A8C6A, true},
    {"Makefile", U'\xEEFF', 0xFF4A8C6A, true},
    {"Dockerfile", U'\xE7B0', 0xFF5A9CB8, true},
    {"docker-compose.yml", U'\xE7B0', 0xFF5A9CB8, true},
    {".dockerignore", U'\xE7B0', 0xFF4A4A4A, true},
    {"VERSION", U'\xF02B', 0xFF9C8C4A, true},
    {"README.md", U'\xF02D', 0xFF5A9CB8, true},
    {"CLAUDE.md", U'\xEE0D', 0xFF7A5A9C, true},
    {"LICENSE", U'\xF0A3', 0xFF9C8C4A, true},
    {"package.json", U'\xE71E', 0xFFA84A4A, true},
    {"package-lock.json", U'\xE71E', 0xFF4A4A4A, true},
    {"tsconfig.json", U'\xE8CA', 0xFF5A9CB8, true},
    {"vite.config.ts", U'\xF0E7', 0xFF9C8C4A, true},
    {".gitignore", U'\xF1D3', 0xFFB8863A, true},
    {".gitmodules", U'\xF1D3', 0xFFB8863A, true},
    {".gitattributes", U'\xF1D3', 0xFFB8863A, true},
    {".editorconfig", U'\xF1DE', 0xFF4A4A4A, true},
    {".eslintrc.cjs", U'\xF085', 0xFF7A5A9C, true},
    {".prettierrc", U'\xF1FC', 0xFF9C8C4A, true},
    {"build.sh", U'\xF135', 0xFF4A8C6A, true},
    {"PKGBUILD", U'\xF187', 0xFF5A9CB8, true},
};
constexpr int NAME_ICONS_COUNT = 21;

// -- Special icons --
constexpr FileIcon FOLDER_CLOSED = {"", U'\xF07B', 0xFF9C8C4A, false};
constexpr FileIcon FOLDER_OPEN = {"", U'\xF07C', 0xFF9C8C4A, false};
constexpr FileIcon SUBMODULE = {"", U'\xF126', 0xFF5A9CB8, false};
constexpr FileIcon UNKNOWN = {"", U'\xF016', 0xFF5A5A5A, false};

}  // namespace ase::file_icons
