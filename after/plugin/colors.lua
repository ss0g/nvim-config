function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local light = 'catppuccin-latte'
local dark = 'tokyonight'

function ColorLight()
    ColorMyPencils(light)
end

function ColorDark()
    ColorMyPencils(dark)
end

-- ColorMyPencils()

local hour = tonumber(os.date("%H", os.time()))

if hour > 7 and hour < 20 then
    ColorLight()
else
    ColorDark()
end

vim.api.nvim_create_user_command('Light', function() ColorMyPencils(light) end, { nargs = 0 })
vim.api.nvim_create_user_command('Dark', function() ColorMyPencils(dark) end, { nargs = 0 })
