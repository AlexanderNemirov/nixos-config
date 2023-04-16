{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_terminal";
      editor = {
        indent-guides = {
          render = true;
          character = "⸽";
        };
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker.hidden = false;
      };
    };
  };
}
