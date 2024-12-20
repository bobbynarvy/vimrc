-- nvim-treesitter config; 
-- =======================
-- more at :help nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "clojure", "go", "hare", "html",
    "javascript", "json", "lua", "ruby", "rust", "typescript",
    "yaml", "zig"
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true
  }
}

-- nvim-lsp config
-- ===============

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function create_lsp_command(...) vim.api.nvim_buf_create_user_command(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  create_lsp_command('Ld', function(i) vim.lsp.buf.definition() end, {desc = 'Go to definition'})
  create_lsp_command('LD', function(i) vim.lsp.buf.declaration() end, {desc = 'Go to declaration'})
  create_lsp_command('Lt', function(i) vim.lsp.buf.type_definition() end, {desc = 'Go to type definition'})
  create_lsp_command('Lr', function(i) vim.lsp.buf.references() end, {desc = 'List references'})
end

-- Config info can be found here:
-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
require'lspconfig'.ts_ls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
local nvim_lsp = require('lspconfig')
local servers = { 'clangd', 'gopls', 'zls', 'ts_ls' }

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- nvim-cmp
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})


-- phaazon/hop.nvim
require'hop'.setup()

-- nvim-tree
require'nvim-tree'.setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
        diagnostics = false,
        bookmarks = false,
      }
    }
  }
})

-- Key remappings
-- ==============
-- more info: https://github.com/nanotee/nvim-lua-guide#vimkeymap

-- Remap :tabprev and :tabnext
vim.keymap.set('n', 'gh', 'gT')
vim.keymap.set('n', 'gl', 'gt')

-- Remap window switching 
vim.keymap.set('n', 'HH', '<C-W>h')
vim.keymap.set('n', 'JJ', '<C-W>j')
vim.keymap.set('n', 'KK', '<C-W>k')
vim.keymap.set('n', 'LL', '<C-W>l')

-- Commands
-- ========
-- more info: https://github.com/nanotee/nvim-lua-guide#defining-user-commands

-- Shortcuts for Telescope
vim.api.nvim_create_user_command('Tf', 'Telescope find_files hidden=true', {})
vim.api.nvim_create_user_command('Tg', 'Telescope live_grep', {})
vim.api.nvim_create_user_command('Tb', 'Telescope buffers', {})
vim.api.nvim_create_user_command('Th', 'Telescope help_tags', {})

vim.api.nvim_create_user_command('NT', 'NvimTreeToggle', {})
vim.api.nvim_create_user_command('NTF', 'NvimTreeFocus', {})
vim.api.nvim_create_user_command('NTR', 'NvimTreeRefresh', {})
vim.api.nvim_create_user_command('HW', 'HopWord', {})
