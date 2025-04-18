local lsp = require("lsp-zero")

vim.g.tex_flavor = "latex"

lsp.preset("recommended")

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
--	print("help")
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- lsp.setup()

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
	},
	handlers = {
		lsp.default_setup
	}
})

local lua_ls_config = {
    settings = {
        diagnostics = {
            globals = {
                'vim'
            }
        }
    }
}

local jdtls_config = {
    settings = {
        java = {
            format = {
                settings = {
                    url = vim.fn.getcwd(-1, -1) .. '/eclipse-formatter.xml'
                }
            }
        }
    }
}

local ocamllsp_config = {
    cmd = { "ocamllsp" }
}

local uno_fqbn = "arduino:avr:uno"
local arduino_ls_config = {
    cmd = {
        "arduino-language-server",
        "-cli-config", "/home/troye/.config/arduino-cli.yaml",
        "-fqbn", uno_fqbn
    }
}

-- local clangd_config = {
--     cmd = { "clangd -xc" }
-- }

require("lspconfig").lua_ls.setup(lua_ls_config);
require("lspconfig").jdtls.setup(jdtls_config);
require("lspconfig").ocamllsp.setup(ocamllsp_config);
require("lspconfig").arduino_language_server.setup(arduino_ls_config);
-- require("lspconfig").clangd.setup(clangd_config);
