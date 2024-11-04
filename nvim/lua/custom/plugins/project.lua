-- Lue
return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      patterns = { '=src', '.git', 'Makefile', '*.sln', 'build/env.sh' },

      -- Telescope Integration
      require('telescope').load_extension 'projects',

      -- Telescope Project Picker
     -- require('telescope').extensions.projects.projects {},
    }
  end,
}
