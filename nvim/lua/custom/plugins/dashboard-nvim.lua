return {
  'nvimdev/dashboard-nvim',
  lazy = false,
  opts = function()
    local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

[ @AlexanderLB98]
    ]]

    logo = string.rep('\n', 8) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),
        center = {
          { action = "lua require'telescope'.extensions.projects.projects{}", desc = ' Find Project', icon = ' ', key = 'p' },

          { action = 'Telescope find_files', desc = ' Find File', icon = ' ', key = 'f' },
          { action = 'ene | startinsert', desc = ' New File', icon = ' ', key = 'n' },
          { action = 'Telescope oldfiles', desc = ' Recent Files', icon = ' ', key = 'r' },
          { action = 'Telescope live_grep', desc = ' Find Text', icon = ' ', key = 'g' },
          { action = 'edit ~/.config/nvim/init.lua', desc = ' Config', icon = ' ', key = 'c' },
          { action = 'lua require("persistence").load()', desc = ' Restore Session', icon = ' ', key = 's' },
          { action = 'LazyExtras', desc = ' Lazy Extras', icon = ' ', key = 'x' },
          { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
          { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    if vim.o.filetype == 'lazy' then
      vim.api.nvim_create_autocmd('WinClosed', {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
          end)
        end,
      })
    end

    return opts
  end,
}
