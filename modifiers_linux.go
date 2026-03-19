package hotkey

import "golang.design/x/hotkey"

// 定义Linux平台支持的修饰键映射，用整数常量替代库中缺失的ModAlt和ModWin
const (
    customModAlt = 1 << iota // 自定义alt修饰键常量
    customModWin             // 自定义win修饰键常量
)

var modifierMap = map[string]hotkey.Modifier{
    "ctrl":    hotkey.ModCtrl,
    "control": hotkey.ModCtrl,
    "shift":   hotkey.ModShift,
    "alt":     customModAlt,
    "option":  customModAlt,
    "cmd":     customModWin,
    "command": customModWin,
    "meta":    customModWin,
    "super":   customModWin,
}

// 补充解析逻辑，将自定义常量转换为库可识别的修饰键（需结合库的底层实现调整）
func parseModifier(mod string) hotkey.Modifier {
    if m, ok := modifierMap[mod]; ok {
        return m
    }
    return 0
}