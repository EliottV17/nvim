return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg = "#121212",
        dark_bg = "#0d0d0d",
        darker_bg = "#080808",
        lighter_bg = "#212121",

        fg = "#e0e0e0",
        dark_fg = "#adadad",
        light_fg = "#eaeaea",
        bright_fg = "#fafafa",
        muted = "#5a5a5a",

        red = "#8a8a8a",
        yellow = "#9e9e9e",
        orange = "#949494",
        green = "#767676",
        cyan = "#767676",
        blue = "#626262",
        magenta = "#8a8a8a",
        brown = "#545454",

        bright_red = "#9e9e9e",
        bright_yellow = "#b2b2b2",
        bright_green = "#767676",
        bright_cyan = "#9e9e9e",
        bright_blue = "#626262",
        bright_magenta = "#8a8a8a",

        accent = "#626262",
        cursor = "#fafafa",
        foreground = "#e0e0e0",
        background = "#121212",
        selection = "#0d0d0d",
        selection_foreground = "#121212",
        selection_background = "#e0e0e0",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
