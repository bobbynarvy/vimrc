-- nvim-treesitter config; 
-- =======================
-- more at :help nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "clojure", "graphql", "go", "hcl", "html",
    "javascript", "json", "ruby", "rust", "typescript",
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
require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
local nvim_lsp = require('lspconfig')
local servers = { 'tsserver', 'clangd', 'gopls' }

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

-- nvim-compe
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  source = {
    path = true;
    buffer = true;
    tags = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

-- phaazon/hop.nvim
require'hop'.setup()

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

vim.api.nvim_create_user_command('NT', 'NERDTree', {})
vim.api.nvim_create_user_command('HW', 'HopWord', {})
