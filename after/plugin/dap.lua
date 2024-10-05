local path = '/home/troye/.local/share/nvim/mason/bin/OpenDebugAD7'

local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/troye/.local/share/nvim/mason/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function ()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
