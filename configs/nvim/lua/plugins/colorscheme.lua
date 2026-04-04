return {
  -- { "tomasr/molokai" },
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- load during startup since it's the main colorscheme
    priority = 1000, -- load before other plugins
  },

  -- tell LazyVim to use it as the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_light_high_contrast",
      -- colorscheme = "molokai",
    },
  },
}
