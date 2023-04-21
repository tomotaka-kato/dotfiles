-- プリントデバッグの方法
-- wezterm.log_info('message')

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

local is_windows = wezterm.target_triple:find("windows")

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'OneHalfDark'

config.hide_tab_bar_if_only_one_tab = true
-- config.font = wezterm.font_with_fallback {
--     'HackGenNerd'
-- }
config.font = wezterm.font('HackGen Console NF')
config.cell_width = 1.2
config.adjust_window_size_when_changing_font_size = false

config.audible_bell = "Disabled"

-- 画像を背景にする場合の設定
-- windowの大きさが変わった時の挙動がちょっと気に入らなかったので未設定
-- local f = io.popen("echo %USERPROFILE%")
-- local home_dir = f:read("*l")
-- f:close()
-- config.window_background_image = string.format('%s\\Documents\\wallpaper\\retrowave-synthwave-neon-ultrawide-wallpaper-preview.jpg', home_dir)
-- config.text_background_opacity = 0.3


-- 背景画像の設定
local root_dir_command = ''
if is_windows then
    root_dir_command = 'echo %USERPROFILE%'
else
    root_dir_command = 'echo $HOME/src'
end
local f = io.popen(root_dir_command)
local home_dir = f:read("*l")
f:close()
local image_path = home_dir .. '/dotfiles/wallpaper/wallpaper.jpg'
config.background = {
    {
        source = {
            File = image_path
        }
    },
    {
        source = {
            Color="black"
        },
        width = '100%',
        height = '100%',
        opacity = 0.85
    }
}


-- 起動するシェルの選択
if is_windows then
  local f = io.popen("whoami")
  local user = f:read("*l")
  f:close()
  if user:find("tomo") then
    config.default_prog = { 'wsl.exe' }
  else
    config.default_prog = { 'powershell.exe' }
  end
end

-- and finally, return the configuration to wezterm
return config
