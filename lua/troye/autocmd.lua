vim.api.nvim_create_autocmd('BufEnter', {
    pattern = {'*.tex', '*.md', '*.bib'},
    group = group,
    command = 'setlocal wrap | setlocal linebreak'
})
