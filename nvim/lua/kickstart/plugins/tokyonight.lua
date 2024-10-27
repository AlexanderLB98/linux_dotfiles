return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Asegúrate de cargar esto antes de otros plugins.
    config = function()
      require('tokyonight').setup {
        style = 'night', -- O el estilo que prefieras: "storm", "moon", "day"
        transparent = true, -- Activa la transparencia
        on_colors = function(colors) end, -- Callback vacío
        on_highlights = function(highlights, colors) end, -- Callback vacío
      }

      -- Carga el esquema de colores
      vim.cmd.colorscheme 'tokyonight-night'

      -- Configuración adicional de resaltado si lo necesitas
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
