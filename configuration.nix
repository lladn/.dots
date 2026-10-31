{ pkgs, user, ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = user;
  system.stateVersion = 6;

  # CLI tools: from nixpkgs instead of brew
  environment.systemPackages = with pkgs; [
    azure-cli
    bat
    dart-sass
    eza
    ffmpeg
    hugo
    neovim
    pandoc
    poppler-utils
    ripgrep
    rtk
    starship
    uv
  ];

  fonts.packages = [ pkgs.nerd-fonts.hack ];

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      ApplePressAndHoldEnabled = false;  # key repeat instead of accent popup
      _HIHideMenuBar = false;  # always show the menu bar
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "WhenScrolling";
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    dock = {
      autohide = true;
      tilesize = 48;
      show-recents = false;
      wvous-tr-corner = 12;  # hot corner: Notification Center
      wvous-bl-corner = 1;   # disabled
      wvous-br-corner = 1;   # disabled
    };
    finder = {
      FXPreferredViewStyle = "clmv";  # column view by default
      CreateDesktop = false;          # clean desktop
      ShowPathbar = true;
    };
    WindowManager.EnableStandardClickToShowDesktop = false;
  };

  nix-homebrew = {
    enable = true;
    inherit user;
    autoMigrate = true;  # adopt the existing /opt/homebrew install
  };

  # GUI apps and anything not in nixpkgs stay on brew, managed declaratively
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";  # remove anything not listed here
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    taps = [ "morantron/tmux-fingers" "alexx855/better-resource-monitor" ];
    brews = [
      "herdr"  # not in nixpkgs
      "morantron/tmux-fingers/tmux-fingers"  # binary used by the TPM plugin
    ];
    casks = [
      "claude-code"
      "ghostty"
      "orbstack"
      "alexx855/better-resource-monitor/better-resource-monitor"
    ];
  };
}
