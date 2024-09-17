-- プリントデバッグの方法
-- wezterm.log_info('message')

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

local is_windows = wezterm.target_triple:find("windows")
local is_mac = wezterm.target_triple:find("apple")

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.color_scheme = "OneHalfDark"

config.hide_tab_bar_if_only_one_tab = true
-- config.font = wezterm.font_with_fallback 'HackGen Console NF'
if is_windows then
	config.font = wezterm.font("HackGen Console NF")
else
	config.font = wezterm.font("PlemolJP Console")
end
config.cell_width = 1.2
config.adjust_window_size_when_changing_font_size = true
config.use_cap_height_to_scale_fallback_fonts = true
config.line_height = 1.5

if is_windows then -- windowsはmacに比べてフォントが大きいので小さくする
	config.font_size = 13.0
else
	config.font_size = 16.0
end

config.audible_bell = "Disabled"

-- 背景画像の設定
-- local root_dir_path = ''
-- if is_windows then
--     local _, dir, _ = wezterm.run_child_process({"echo", "-n", "~"})
--     root_dir_path = string.gsub(dir, '/c/', 'C:/')
-- elseif is_mac then
--     root_dir_path = '$HOME/src/github.com/tomotaka-kato'
-- else
--     root_dir_path = '$HOME/src'
-- end
-- local image_path = root_dir_path .. '/dotfiles/wallpaper/wallpaper.jpg'

local opacity = 1
if is_windows then
	opacity = 0.85
	config.win32_system_backdrop = "Acrylic"
else
	opacity = 0.9
	config.macos_window_background_blur = 30
end

config.background = {
	{
		source = {
			Color = "black",
		},
		width = "100%",
		height = "100%",
		opacity = opacity,
	},
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- 起動するシェルの選択
if is_windows then
	-- config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
	config.default_prog = { "wsl" }
elseif is_mac then
end

-- keymap
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
	},
	{
		key = "H",
		mods = "LEADER",
		action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }),
	},
	{
		key = "K",
		mods = "LEADER",
		action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }),
	},
	{
		key = "L",
		mods = "LEADER",
		action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }),
	},
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action({ PaneSelect = {} }),
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action({
			PaneSelect = {
				mode = "SwapWithActive",
			},
		}),
	},
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{ -- keyballだと[を若干打ちにくいのでpにも割り当てる
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "N",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

return config
