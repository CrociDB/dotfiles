local dap, dapui = require("dap"), require("dapui")

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
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})

-- ADAPTERS
dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  name = "lldb"
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  name = "gdb"
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
  },
}

