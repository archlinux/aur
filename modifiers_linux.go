package hotkey

import "golang.design/x/hotkey"

// modifierMap 定义 Linux 平台支持的修饰键映射
// 注意：Linux 下使用 Mod1 代表 Alt，Mod4 代表 Super/Win
var modifierMap = map[string]hotkey.Modifier{
	"ctrl":    hotkey.ModCtrl,
	"control": hotkey.ModCtrl,
	"shift":   hotkey.ModShift,
	"alt":     hotkey.Mod1,
	"option":  hotkey.Mod1,
	"meta":    hotkey.Mod1,
	"super":   hotkey.Mod4,
	"cmd":     hotkey.Mod4,
	"command": hotkey.Mod4,
	"win":     hotkey.Mod4,
}

// platformKeys 定义 Linux 平台特定的按键映射（用于补充 keyMap）
var platformKeys = map[string]hotkey.Key{}

// 定义 Linux 平台支持的修饰键常量（备用）
const (
	customModAlt = 1 << iota // 自定义 alt 修饰键常量
	customModWin             // 自定义 win 修饰键常量
)

// 补充解析逻辑，将自定义常量转换为库可识别的修饰键（需结合库的底层实现调整）
func parseModifier(mod string) hotkey.Modifier {
	if m, ok := modifierMap[mod]; ok {
		return m
	}
	return 0
}