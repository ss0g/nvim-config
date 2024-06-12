function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

local light = 'catppuccin-latte'
local dark = 'tokyonight'

vim.api.nvim_create_user_command('Light', function() ColorMyPencils(light) end, { nargs = 0 })
vim.api.nvim_create_user_command('Dark', function() ColorMyPencils(dark) end, { nargs = 0 })
