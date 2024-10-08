require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
    hover = { enabled = false },
    signature = { enabled = false },
  },
  hover = {
    enabled = true,
    silent = false, -- set to true to not show a message if hover is not available
    view = nil, -- when nil, use defaults from documentation
    ---@type NoiceViewOptions
    opts = {}, -- merged with defaults from documentation
  },
  signature = {
    enabled = true,
    auto_open = {
      enabled = true,
      trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
      luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
      throttle = 50, -- Debounce lsp signature help request by 50ms
    },
    view = nil, -- when nil, use defaults from documentation
    ---@type NoiceViewOptions
    opts = {}, -- merged with defaults from documentation
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true, -- enables the Noice messages UI
    view = "mini", -- default view for messages
    view_error = "mini", -- view for errors
    view_warn = "mini", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
