{ config, lib, pkgs, user, ... }:

let
  dotfiles = "/Users/${user}/lladn/.dots";
in
{
  home.username = user;
  home.homeDirectory = "/Users/${user}";
  home.stateVersion = "26.05";
  # ripgrep, neovim and nerd-fonts.hack come from configuration.nix
  home.packages = with pkgs; [
    # cli i use constantly
    fd        # fast find
    fzf       # fuzzy finder
    jq        # json on the command line
    lazygit
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;      # ghost text from history
    syntaxHighlighting.enable = true;  # commands turn green when valid
    defaultKeymap = "emacs";           # also gives ^A / ^E line start/end for tmux
    history = {
      size = 99999;
      save = 99999;
      path = "$HOME/.zsh_history";
      append = true;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      share = true;
    };
    initContent = ''
      setopt hist_verify

      bindkey '^f' autosuggest-accept

      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey '^X^E' edit-command-line

      eval "$(~/.local/bin/mise activate zsh)"
    '';
    shellAliases = {
      ".." = "cd ..";
      add = "git add .";
      push = "git push";
      pull = "git pull";
      m = "git switch main";
      cc = "claude";
      co = "codex --full-auto";
      vv = "nvim";
      nm = "no-mistakes";
      lsg = "cd ~/workspace";

      # kubernetes
      k = "kubectl";
      kns = "kubens";
      ktx = "kubectx";
      kgps = "kubectl get pods";
      kgp = "kubectl get pod";
      kdes = "kubectl describe";
      kdel = "kubectl delete";
      kaf = "kubectl apply -f";
      klog = "kubectl logs";

      # git
      gl = "git log";
      gc = "git checkout";
      gb = "git branch";
      gp = "git pull";
      gs = "git status";
      gps = "git push";
      gcb = "git checkout $(git branch -a | fzf)";
      gsl = "git stash list";
      gsa0 = "git stash apply stash@{0}";
      gss = "git stash save";

      # eza / bat (installed via configuration.nix)
      ls = "eza";
      ll = "eza -lhg";
      lla = "eza -alhg";
      tree = "eza --tree";
      cat = "bat --paging=never --style=plain";
      catt = "bat";
      cata = "bat --show-all --paging=never";

      # aws
      aws-prod-euw2 = "aws --profile prod --region eu-west-2";
      aws-prod-euw1 = "aws --profile prod --region eu-west-1";
      aws-prod-use1 = "aws --profile prod --region us-east-1";
      aws-dev-euw2 = "aws --profile dev --region eu-west-2";
      aws-dev-euw1 = "aws --profile dev --region eu-west-1";
    };
  };

  # No settings here: config lives in the repo at home/.config/starship.toml.
  programs.starship.enable = true;

  # Live symlinks into the repo (edits apply without a rebuild).
  # home/ mirrors $HOME, so each entry links ~/<path> to home/<path>.
  home.file = lib.genAttrs [
    ".config/nvim"
    ".config/ghostty"
    ".config/mise"
    ".config/starship.toml"
    ".tmux.conf"
    ".claude/settings.json"
    ".claude/CLAUDE.md"
    ".claude/commands"
  ] (path: { source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/${path}"; })
  // {
    # Agent-agnostic rules, shared by every agent that reads AGENTS.md.
    ".claude/AGENTS.md".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  };
}
