return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>"),
	vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>"),
	vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>"),
	vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>"),
}
