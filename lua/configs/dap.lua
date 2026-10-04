local dap = require("dap")
local dapui = require("dapui")

-- =====================
-- DAP Adapters
-- =====================

-- C / C++ / Rust via lldb or gdb
dap.adapters.cppdbg = {
  type = 'executable',
  command = 'lldb-vscode', -- install lldb or lldb-vscode
  name = "lldb"
}

-- C# (.NET / Blazor) via netcoredbg
dap.adapters.coreclr = {
  type = "executable",
  command = "netcoredbg",
  args = {"--interpreter=vscode"}
}

-- =====================
-- DAP Configurations
-- =====================

-- C
dap.configurations.c = {
  {
    name = "Launch C program",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

-- C++ (optional)
dap.configurations.cpp = dap.configurations.c

-- C# (.NET / Blazor)
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch .NET",
    request = "launch",
    program = function()
      return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}



dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Debug Next.js server",
    program = "${workspaceFolder}/node_modules/next/dist/bin/next",
    args = { "dev" },
    cwd = "${workspaceFolder}",
    runtimeArgs = { "--inspect" },
    console = "integratedTerminal",
  },
  {
    type = "pwa-chrome",
    request = "launch",
    name = "Debug Next.js client",
    url = "http://localhost:3000",
    webRoot = "${workspaceFolder}",
  },
}

dap.configurations.typescript = dap.configurations.javascript








-- =====================
-- DAP UI Setup
-- =====================

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
  },
  layouts = {
    {
      elements = { "scopes", "breakpoints", "stacks", "watches" },
      size = 40,
      position = "left",
    },
    {
      elements = { "repl" },
      size = 10,
      position = "bottom",
    },
  },
})

-- Open / Close UI automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- =====================
-- Keymaps (optional)
-- =====================
local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "DAP Continue" })
map("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
map("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
map("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
map("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })
map("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL Open" })
map("n", "<leader>dl", dap.run_last, { desc = "DAP Run Last" })
