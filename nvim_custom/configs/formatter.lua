local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    css = {
      require("formatter.filetypes.css").prettier
    },
    html = {
      require("formatter.filetypes.html").prettier
    },
    haskell = {
      require("formatter.filetypes.haskell").fourmolu
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whites
    }
  }
}

-- vim.api.nvim_create_autocmd({ "bufwritepost" }, {
--   command = "formatwritelock"
-- })

return M
