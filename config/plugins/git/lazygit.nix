{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    lazygit-nvim
  ];

  extraConfigLua = ''
    require("telescope").load_extension("lazygit")
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }

  ];

  use_custom_config_file = true;
  config_file_path = [
    builtins.toString
    ./customconfig.yml
  ];
}
