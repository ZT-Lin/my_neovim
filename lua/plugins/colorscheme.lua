--背景透明化
local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
end

--主题
return {
    {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
	    vim.cmd.colorscheme 'catppuccin'
	    enable_transparency()
	end
    },
}
