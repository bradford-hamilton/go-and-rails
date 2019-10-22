# module Quartz::Validations
#   def self.check_for_go
#     puts ENV['PATH']
#     go_exists = ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
#       File.exist?(File.join(directory, 'go'))
#     end

#     raise Quartz::ConfigError, 'Go not installed.' unless go_exists
#   end
# end
puts ENV['PATH']
Quartz = Quartz::Client.new(file_path: 'app/go/exported_functions.go')