return {
  "augmentcode/augment.vim",
  -- Configure workspace folders to help Augment understand your codebase
  -- This is essential for getting the most out of Augment
  init = function()
    -- Add your project directories here
    vim.g.augment_workspace_folders = {
      -- Example: "~/projects/my-project",
      -- You can add multiple workspace folders
    }
    
    -- Optional: Disable the default tab mapping if it conflicts with other plugins
    -- vim.g.augment_disable_tab_mapping = true
    
    -- Optional: Disable completions entirely (not recommended)
    -- vim.g.augment_disable_completions = true
  end,
}
