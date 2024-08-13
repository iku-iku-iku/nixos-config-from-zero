# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod = {
	enable = true;
	type = "fcitx5";
	fcitx5.addons = with pkgs; [ fcitx5-rime ];
  };
  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver = {
	enable = true;
	displayManager.gdm = {
		enable = true;
		wayland = false;
		autoSuspend = false;
	};
	desktopManager.gnome.enable = true;
  };

  services.keyd = {
	enable = true;
	keyboards.default = {
		ids = [ "*" ];
		settings.main.capslock = "overload(control, esc)";
	};
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "ctrl:swapcaps";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
	mutableUsers = true;
	users.cute = {
	    isNormalUser = true;
	    home = "/home/cute";
	    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
	    packages = with pkgs; [
	      firefox
	      tree
	      kitty
	      clash-verge-rev
	      neofetch
	      htop
	      lm_sensors
	    ];
	};
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    fish
  ];

  programs = {
	bash = {
	  interactiveShellInit = ''
	    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
	    then
	      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
	      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
	    fi
	  '';
	};

	fish.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

  services.openssh = {
	enable = true;
	settings = { 
		PasswordAuthentication = true;
		KbdInteractiveAuthentication = true;
		PermitRootLogin = "no";
  	};
  };
  users.users."cute".openssh.authorizedKeys.keys = [
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRxtbaL6CFAGEr6Evu8s0RwKO4VM63HwU7COST+qE7aj88jIstzm8tHsjCNdzJ91E/Zpye6lBn/24Pu2gFl66zxyXMPivCZbKyACCFEmpHLWUa8ALDjlxUM0ypA0CBhuGz7Vk4Dfb2GYJfLP1dU+PIAVA/3tJumPZ3VDTWa/ymgVEUc5NcnzO6R4vIxScEjcpCarKOvg77Hq3wBpnBQIUJUvfZnDqNBgFzuqs0hElZ+5jgP9w0zQJ30bUkdNYb6d0E0Wvav/3tFge0hrvnkYKr5z59n7yC2ATvg80Fb8IJXv7dAGcVAWXqHxim3HY6BH4+5XfTzM0E3fAAwZkeQ1YNihFcmfDQib9gtq8fM4EKAtg7NOQR4luxeQ4MJXLpAr0tTwO6FxAn8lYPjCN0e6f1aUtAHtCW3/B6w6mssl+dKbmaSiqDzVefuu54k2R8hWzp5zWH9IQm2nfGVyO+mTr0kxrTTF+cdaRVdWl7Hij6CwXINCiJqqeQ7HdVAzIiqLk= code4love@CODE"
  ];

  networking.firewall.allowedTCPPorts = [ 22 ];

  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

