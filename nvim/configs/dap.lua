local dap, dapui = require("dap"), require("dapui")

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- KEYMAPS
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>db", dapui.toggle)
vim.keymap.set("n", "<Leader>dc", dap.continue, {})
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)

-- ADAPTERS
dap.adapters.lldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
    }
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

-- CONFIGURATIONS
dap.configurations.zig = {
  {
    name = "Launch",
    type = "lldb",
    requrest = "launch",
    -- program = "${workspaceFolder}/${workspaceFolderBasename}",
    program = "${workspaceFolder}/main",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end,
  },
}

dap.configurations.c = dap.configurations.zig
dap.configurations.cpp = dap.configurations.zig

