-- nvim-treesitter config; more at :help nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "clojure", "graphql", "hcl", "html",
    "javascript", "json", "ruby", "rust", "typescript",
    "yaml"
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true
  }
}

-- nvim-lspconfig config
-- Config info can be found here:
-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
require'lspconfig'.tsserver.setup{}
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'LD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'Ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'Lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'LR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'Lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap("n", "Lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
