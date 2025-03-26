local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "hermitfeather.lazy",
    change_detection = { notify = false },
    rocks = { enabled = false, }
},
    {
    'huggingface/llm.nvim',
    opts = {
            model = "starcoder2:3b",
  backend = "ollama",
  url = "http://localhost:11434",
  request_body = {
    options = {
      temperature = 0.2,
      top_p = 0.95,
    },
  },
  debounce_ms = 150,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<S-Tab>",
  lsp = {
    bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
  },
  enable_suggestions_on_startup = true,
  enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
  disable_url_path_completion = false, -- cf Backend
    }
    }
)
