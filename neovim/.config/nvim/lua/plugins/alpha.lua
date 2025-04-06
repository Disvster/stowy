return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Function to load random header
    local function load_random_header()
      -- Get all .lua files from header directory
      local header_files = vim.fn.globpath(
        vim.fn.stdpath("config") .. "/lua/plugins/header_img",
        "*.lua",
        true,
        true
      )

      if #header_files == 0 then
        vim.notify("No header files found in plugins/header_img", vim.log.levels.WARN)
        return { "No headers found!" }
      end

      -- Pick random file
      local random_file = header_files[math.random(#header_files)]
      local module_path = "plugins.header_img." .. string.match(random_file, "([^/]+)%.lua$")

      -- Load the header
      local ok, header_module = pcall(require, module_path)
      if ok and header_module.header then
        return header_module.header
      else
        return { "Failed to load: " .. module_path }
      end
    end

    -- Set random header
    dashboard.section.header.val = load_random_header()

    -- Basic dashboard buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
  end
}
