local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
  theme = 'doom',
  config = {
    header = {
[[                                                     ]],
[[                                                     ]],
[[██████╗ ███████╗████████╗████████╗███╗   ███╗██████╗ ]],
[[██╔══██╗██╔════╝╚══██╔══╝╚══██╔══╝████╗ ████║██╔══██╗]],
[[██████╔╝█████╗     ██║      ██║   ██╔████╔██║██████╔╝]],
[[██╔══██╗██╔══╝     ██║      ██║   ██║╚██╔╝██║██╔═══╝ ]],
[[██║  ██║███████╗   ██║      ██║   ██║ ╚═╝ ██║██║     ]],
[[╚═╝  ╚═╝╚══════╝   ╚═╝      ╚═╝   ╚═╝     ╚═╝╚═╝     ]],
[[                                                     ]],
[[                [ version : 1.0.0 ]                  ]],
[[                                                     ]],
    }, --your header
    center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
    },
    footer = {}  --your footer
  }
})
