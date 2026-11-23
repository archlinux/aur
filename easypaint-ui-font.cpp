#include <os/app/Application.h>
#include <os/interface/Font.h>

#include <gio/gio.h>
#include <glib.h>
#include <glib/gfileutils.h>
#include <glib/gstring.h>
#include <pango/pango.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>

extern void _set_system_font_(const char* which, font_family family,
	font_style style, float size);

struct FontSpec {
	std::string family;
	std::string style;
	float size = 11.0f;
};

static constexpr float kGtkSizeBoost = 4.0f;

static void
boost_gtk_size(FontSpec& spec)
{
	spec.size += kGtkSizeBoost;
}

static std::string
config_path()
{
	const char* xdg = g_getenv("XDG_CONFIG_HOME");
	std::string base = (xdg != NULL && *xdg != '\0')
		? std::string(xdg) : std::string(g_get_home_dir()) + "/.config";
	return base + "/easypaint/ui-font";
}

static bool
read_key(const std::string& path, const char* key, std::string& value)
{
	FILE* file = fopen(path.c_str(), "r");
	if (file == NULL)
		return false;

	const std::string prefix = std::string(key) + "=";
	char line[512];
	bool found = false;
	while (fgets(line, sizeof(line), file) != NULL) {
		std::string text(line);
		if (!text.empty() && text.back() == '\n')
			text.pop_back();
		if (text.compare(0, prefix.size(), prefix) == 0) {
			value = text.substr(prefix.size());
			found = true;
			break;
		}
	}
	fclose(file);
	return found;
}

static FontSpec
parse_font(const std::string& text)
{
	FontSpec spec;
	PangoFontDescription* description = pango_font_description_from_string(text.c_str());
	if (description == NULL)
		return spec;

	const char* family = pango_font_description_get_family(description);
	if (family != NULL)
		spec.family = family;

	const PangoStyle style = pango_font_description_get_style(description);
	const PangoWeight weight = pango_font_description_get_weight(description);
	if (weight >= PANGO_WEIGHT_BOLD)
		spec.style = "Bold";
	else if (style == PANGO_STYLE_ITALIC)
		spec.style = "Italic";
	else if (style == PANGO_STYLE_OBLIQUE)
		spec.style = "Oblique";
	else
		spec.style = "Regular";

	const gint size = pango_font_description_get_size(description);
	if (size > 0)
		spec.size = (float)size / PANGO_SCALE;

	pango_font_description_free(description);

	if (spec.family.empty())
		spec.family = "Noto Sans";
	if (spec.size <= 0.0f)
		spec.size = 11.0f;
	return spec;
}

static bool
family_exists(const std::string& family)
{
	const int32 count = count_font_families();
	for (int32 i = 0; i < count; i++) {
		font_family name;
		if (get_font_family(i, &name, NULL) != B_OK)
			continue;
		if (family == name)
			return true;
	}
	return false;
}

static std::string
fallback_family()
{
	font_family name;
	if (count_font_families() > 0 && get_font_family(0, &name, NULL) == B_OK)
		return name;
	return "Noto Sans";
}

static bool
read_gtk(FontSpec& plain, FontSpec& fixed)
{
	GSettings* settings = g_settings_new("org.gnome.desktop.interface");
	gchar* text = g_settings_get_string(settings, "font-name");
	gchar* mono = g_settings_get_string(settings, "monospace-font-name");
	g_object_unref(settings);

	bool found = false;
	if (text != NULL && *text != '\0') {
		plain = parse_font(text);
		boost_gtk_size(plain);
		found = true;
	}
	if (mono != NULL && *mono != '\0') {
		fixed = parse_font(mono);
		boost_gtk_size(fixed);
	}

	g_free(text);
	g_free(mono);
	if (found)
		return true;

	std::string value;
	const std::string base = std::string(g_get_home_dir()) + "/.config/";
	if (read_key(base + "gtk-3.0/settings.ini", "gtk-font-name", value)) {
		plain = parse_font(value);
		boost_gtk_size(plain);
		return true;
	}
	if (read_key(base + "gtk-4.0/settings.ini", "gtk-font-name", value)) {
		plain = parse_font(value);
		boost_gtk_size(plain);
		return true;
	}
	return false;
}

static void
write_config(const std::string& path, bool manual,
	const FontSpec& plain, const FontSpec& fixed)
{
	const size_t slash = path.rfind('/');
	if (slash != std::string::npos)
		g_mkdir_with_parents(path.substr(0, slash).c_str(), 0755);

	FILE* file = fopen(path.c_str(), "w");
	if (file == NULL)
		return;
	fprintf(file, "mode=%s\n", manual ? "manual" : "gtk");
	fprintf(file, "font-name=%s %s %g\n", plain.family.c_str(),
		plain.style.c_str(), plain.size);
	fprintf(file, "monospace-font-name=%s %s %g\n", fixed.family.c_str(),
		fixed.style.c_str(), fixed.size);
	fclose(file);
}

static void
apply(const FontSpec& plainIn, const FontSpec& fixedIn)
{
	FontSpec plain = plainIn;
	FontSpec fixed = fixedIn;
	if (!family_exists(plain.family))
		plain.family = fallback_family();
	if (!family_exists(fixed.family))
		fixed.family = fallback_family();

	std::string boldStyle = plain.style;
	if (boldStyle == "Regular" || boldStyle.empty())
		boldStyle = "Bold";

	font_family plainFamily;
	font_family plainStyle;
	font_family boldFamilyStyle;
	font_family fixedFamily;
	font_family fixedStyle;
	g_strlcpy(plainFamily, plain.family.c_str(), sizeof(plainFamily));
	g_strlcpy(plainStyle, plain.style.c_str(), sizeof(plainStyle));
	g_strlcpy(boldFamilyStyle, boldStyle.c_str(), sizeof(boldFamilyStyle));
	g_strlcpy(fixedFamily, fixed.family.c_str(), sizeof(fixedFamily));
	g_strlcpy(fixedStyle, fixed.style.c_str(), sizeof(fixedStyle));

	_set_system_font_("plain", plainFamily, plainStyle, plain.size);
	_set_system_font_("bold", plainFamily, boldFamilyStyle, plain.size);
	_set_system_font_("fixed", fixedFamily, fixedStyle, fixed.size);
}

int
main(int argc, char** argv)
{
	const std::string path = config_path();
	const char* command = argc > 1 ? argv[1] : "--auto";
	if (strcmp(command, "--help") == 0 || strcmp(command, "-h") == 0) {
		printf("Usage: easypaint-ui-font [OPTION]...\n"
			"  --auto                        use saved mode (default)\n"
			"  --gtk                         read GNOME/GTK font and add 4 pt\n"
			"  --manual                      use saved manual font\n"
			"  --plain FAMILY STYLE SIZE     set plain/bold UI font\n"
			"  --fixed FAMILY STYLE SIZE     set monospace UI font\n"
			"  --status                      show saved settings\n"
			"  --help                        show this help\n");
		return 0;
	}

	std::string value;
	bool manual = read_key(path, "mode", value) && value == "manual";

	if (strcmp(command, "--status") == 0) {
		std::string mode;
		std::string plain;
		std::string fixed;
		if (read_key(path, "mode", mode))
			printf("mode=%s\n", mode.c_str());
		if (read_key(path, "font-name", plain))
			printf("font-name=%s\n", plain.c_str());
		if (read_key(path, "monospace-font-name", fixed))
			printf("monospace-font-name=%s\n", fixed.c_str());
		return 0;
	}

	if (strcmp(command, "--gtk") == 0)
		manual = false;
	else if (strcmp(command, "--manual") == 0)
		manual = true;
	else if ((strcmp(command, "--plain") == 0 || strcmp(command, "--fixed") == 0)
		&& argc >= 5) {
		manual = true;
	}

	BApplication app("application/x-vnd.easypaint-uifont");

	FontSpec plain;
	FontSpec fixed;
	if (read_key(path, "font-name", value))
		plain = parse_font(value);
	if (read_key(path, "monospace-font-name", value))
		fixed = parse_font(value);

	if (strcmp(command, "--plain") == 0 && argc >= 5) {
		plain.family = argv[2];
		plain.style = argv[3];
		plain.size = (float)atof(argv[4]);
	} else if (strcmp(command, "--fixed") == 0 && argc >= 5) {
		fixed.family = argv[2];
		fixed.style = argv[3];
		fixed.size = (float)atof(argv[4]);
	}

	if (!manual || plain.family.empty()) {
		FontSpec gtkPlain;
		FontSpec gtkFixed;
		if (read_gtk(gtkPlain, gtkFixed)) {
			plain = gtkPlain;
			fixed = gtkFixed;
		} else {
			plain = parse_font("Noto Sans 12");
			boost_gtk_size(plain);
			fixed = parse_font("Noto Sans Mono 11");
			boost_gtk_size(fixed);
		}
	}

	apply(plain, fixed);
	write_config(path, manual, plain, fixed);
	return 0;
}
