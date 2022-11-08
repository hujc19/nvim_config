local Path = require("plenary.path")
local status, cmake = pcall(require, "cmake")
if not status then
  vim.notify("没有找到 neovim-cmake")
  return
end
-- progress = ""

cmake.setup({
  cmake_executable = "cmake", -- CMake executable to run.
  parameters_file = "neovim.json", -- JSON file to store information about selected target, run arguments and build type.
  build_dir = tostring(Path:new("{cwd}", "build", "{os}-{build_type}")), -- Build directory. The expressions `{cwd}`, `{os}` and `{build_type}` will be expanded with the corresponding text values.
  -- samples_path = tostring(script_path:parent():parent():parent() / 'samples'), -- Folder with samples. `samples` folder from the plugin directory is used by default.
  default_projects_path = tostring(Path:new(vim.loop.os_homedir(), "test")), -- Default folder for creating project.
  configure_args = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1 " }, -- Default arguments that will be always passed at cmake configure step. By default tells cmake to generate `compile_commands.json`.
  build_args = {
    "-j 16",
  }, -- Default arguments that will be always passed at cmake build step.
  quickfix_height = 10, -- Height of the opened quickfix.
  quickfix_only_on_error = false, -- Open quickfix window only if target build failed.
  -- on_build_output = function(line)
  --   local match = string.match(line, "(%[.*%])")
  --   if match then
  --     progress = string.gsub(match, "%%", "%%%%")
  --   end
  -- end,
  dap_configuration = {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = true,
    setupCommands = {
      {
        description = "enable pretty printing",
        text = "-enable-pretty-printing",
        ignoreFailures = false,
      },
    },
  }, -- DAP configuration. By default configured to work with `lldb-vscode`.
  dap_open_command = require("dap").repl.open, -- Command to run after starting DAP session. You can set it to `false` if you don't want to open anything or `require('dapui').open` if you are using https://github.com/rcarriga/nvim-dap-ui
})
