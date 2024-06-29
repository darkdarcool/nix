{ inputs, lib, config, ... }:

# We aren't firing the after-burners here
let
  powerSettings = {
    governor = "powersave";
    turbo = "never";
  };
in
{
  options.modules.hardware.auto-cpufreq = {
    enable = lib.mkEnableOption "auto-cpufreq";
  };

  # TODO: Make this configurable
  config = lib.mkIf config.modules.hardware.auto-cpufreq.enable {
    programs.auto-cpufreq = {
      enable = true;
      settings = {
        charger = powerSettings;
        battery = powerSettings;
      };
    };
  };
}
