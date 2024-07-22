local aw_section = {
	function()
		return require("aw_watcher").is_connected() and "󰔛" or "󰔞"
	end,
	cond = function()
		local has_aw, _ = pcall(require, "aw_watcher")
		return has_aw
	end,
}

require("lualine").setup({
	sections = {
		lualine_x = {
			"encoding",
			"filetype",
			aw_section,
		},
	},
})
