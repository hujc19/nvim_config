local common = require("lsp.common-config")
local navic = require("nvim-navic")
common.capabilities.offsetEncoding = "utf-16"

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
    navic.attach(client, bufnr)
  end,
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
