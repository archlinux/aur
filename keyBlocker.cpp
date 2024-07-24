#include <X11/Xlib.h>
#include <X11/XKBlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include <xcb/xcb.h>
#include <unordered_set>

struct pair_hash
{
public:
	template <typename T, typename U>
	auto operator()(const std::pair<T, U> &x) const
	{
		return std::hash<T>()(x.first) ^ std::hash<U>()(x.second);
	}
};

static std::unordered_set<std::pair<int, unsigned int>, pair_hash> blocked_hotkeys;

extern "C" int XGrabKey(
	Display *display,
	int keycode,
	unsigned int modifiers,
	Window grab_window,
	Bool owner_events,
	int pointer_mode,
	int keyboard_mode)
{

	blocked_hotkeys.insert({keycode, modifiers});
	printf("Hotkey registration blocked: keycode=%d modifiers=%d\n", keycode, modifiers);
	return 0;
}

extern "C" int XUngrabKey(
	Display *display,
	int keycode,
	unsigned int modifiers,
	Window grab_window)
{
	blocked_hotkeys.erase({keycode, modifiers});
	printf("Hotkey unregistration blocked: keycode=%d modifiers=%d\n", keycode, modifiers);
	return 0;
}

static bool filter_xcb_event(xcb_connection_t *c, xcb_generic_event_t *event)
{
	if (event != nullptr)
	{
		if (event->response_type == XCB_KEY_PRESS)
		{
			auto key_press = reinterpret_cast<xcb_key_press_event_t *>(event);
			if (blocked_hotkeys.find({key_press->detail, key_press->state}) != blocked_hotkeys.end())
			{
				return false;
			}
		}
		else if (event->response_type == XCB_KEY_RELEASE)
		{
			auto key_release = reinterpret_cast<xcb_key_release_event_t *>(event);
			if (blocked_hotkeys.find({key_release->detail, key_release->state}) != blocked_hotkeys.end())
			{
				return false;
			}
		}
	}
	return true;
}

extern "C" xcb_generic_event_t *xcb_wait_for_event(xcb_connection_t *c)
{
	static auto origin = reinterpret_cast<decltype(&xcb_wait_for_event)>(dlsym(RTLD_NEXT, "xcb_wait_for_event"));
	xcb_generic_event_t *event;
	do
	{
		event = origin(c);
	} while (!filter_xcb_event(c, event));
	return event;
}

extern "C" xcb_generic_event_t *xcb_poll_for_event(xcb_connection_t *c)
{
	static auto origin = reinterpret_cast<decltype(&xcb_poll_for_event)>(dlsym(RTLD_NEXT, "xcb_poll_for_event"));
	xcb_generic_event_t *event;
	do
	{
		event = origin(c);
	} while (!filter_xcb_event(c, event));
	return event;
}
