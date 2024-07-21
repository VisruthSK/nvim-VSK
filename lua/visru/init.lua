require("visru.pckr")
require("visru.remap")
require("visru.set")

-- TODO need to fix LSPs
--[[
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls","pyright","julials"},
}

require("lspconfig").lua_ls.setup{}
require('lspconfig').pyright.setup{}
require('lspconfig').julials.setup{}
]]
