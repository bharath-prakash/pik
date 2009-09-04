module Pik
  VERSION = '0.0.3'
end

require 'erb'
require 'highline'
require 'pathname'
require 'rbconfig'
$LOAD_PATH.unshift File.dirname(__FILE__)
require 'pik/core_ext/pathname'
require 'pik/commands'
require 'pik/commands/config_file_editor'
require 'pik/commands/batch_file_editor'
require 'pik/commands/command'
require 'pik/commands/list_command'
require 'pik/commands/add_command'
require 'pik/commands/help_command'
require 'pik/commands/switch_command'
require 'pik/commands/run_command'
require 'pik/commands/remove_command'
require 'pik/commands/checkup_command'
require 'pik/commands/config_command'
require 'pik/commands/gemdup_command'
require 'pik/config_file'
require 'pik/windows_env'
require 'pik/batch_file'
require 'pik/search_path'

PIK_HOME = Pathname.new( ENV['HOME'] || ENV['USERPROFILE'] ) + '.pik'
