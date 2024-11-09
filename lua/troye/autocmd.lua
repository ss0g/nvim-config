vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {'*.tex', '*.md'},
    group = group,
    command = 'setlocal wrap'
})
