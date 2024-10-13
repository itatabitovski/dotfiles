local wezterm = require "wezterm"

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end
local mod_key = is_darwin() and "CMD" or "ALT"

local config = wezterm.config_builder()

config.color_scheme = "Monokai Dark (Gogh)"
config.font = wezterm.font("JetBrains Mono")
config.default_cursor_style = "SteadyBlock"

config.window_close_confirmation = "NeverPrompt"

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
--config.tab_and_split_indices_are_zero_based = true
--config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- config.disable_default_key_bindings = true



act = wezterm.action
config.keys = {
  { mods = mod_key, key = "Enter", action=act.ToggleFullScreen },

  { mods = mod_key, key = "t", action=act.SpawnTab "CurrentPaneDomain" },
  { mods = mod_key, key = "d", action=act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { mods = mod_key .. "|SHIFT", key = "d", action=wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

  { mods = mod_key, key = "LeftArrow", action = act.ActivatePaneDirection "Left",},
  { mods = mod_key, key = "RightArrow", action = act.ActivatePaneDirection "Right",},
  { mods = mod_key, key = "UpArrow", action = act.ActivatePaneDirection "Up",},
  { mods = mod_key, key = "DownArrow", action = act.ActivatePaneDirection "Down",},
}
for i = 1, 8 do
    table.insert(config.keys, { mods = "ALT", key = tostring(i), action = act.ActivateTab(i-1) })
end

return config
