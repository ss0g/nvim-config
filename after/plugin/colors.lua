function ColorMyPencils(color)
	color = color or "seoul256"
	vim.cmd.colorscheme(color)
end

-- require("catppuccin").setup({
--     transparent_background = true
-- })

-- local light = 'catppuccin-latte'
-- local dark = 'tokyonight'
-- local dark = 'catppuccin-mocha'

-- function ColorLight()
--     ColorMyPencils(light)
-- end

-- function ColorDark()
--     ColorMyPencils(dark)
-- end

-- ColorMyPencils()

-- local hour = tonumber(os.date("%H", os.time()))
--
-- if hour > 7 and hour < 22 then
--     ColorLight()
-- else
--     ColorDark()
-- end

-- ColorLight()

ColorMyPencils()

-- vim.api.nvim_create_user_command('Light', function() ColorMyPencils(light) end, { nargs = 0 })
-- vim.api.nvim_create_user_command('Dark', function() ColorMyPencils(dark) end, { nargs = 0 })
