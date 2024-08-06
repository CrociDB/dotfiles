local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end

dap.listeners.before.launch.dapui_coinfig = function()
  dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end

dap.listeners.before.event_exited.dapui_coinfig = function()
  dapui.close()
end

vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})

dap.adapters.lldb = {
  type = "executable",
  command = "lldb",
  name = "lldb"
}
