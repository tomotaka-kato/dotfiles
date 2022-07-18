local wezterm = require 'wezterm';
-- local color_scheme = "Atlas (base16)"
local color_scheme = "OneHalfDark"
-- local font = "HackGenNerd" -- 相性が悪いのか漢字がめちゃくちゃ小さくなるので標準を使う

return {
  -- font = wezterm.font(font),
  use_ime = true,
  font_size = 16.0,
  color_scheme = color_scheme
}
