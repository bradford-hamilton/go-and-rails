system("cd ~/Downloads")
system("sudo wget -c https://storage.googleapis.com/golang/go1.12.linux-amd64.tar.gz")
system("sudo tar -C /usr/local -xvzf go1.12.linux-amd64.tar.gz")
system("export PATH=$PATH:/usr/local/go/bin")

module Quartz::Validations
  def self.check_for_go
    puts ENV['PATH']
    go_exists = ENV['PATH'].split(File::PATH_SEPARATOR).any? do |directory|
      File.exist?(File.join(directory, 'go'))
    end

    raise Quartz::ConfigError, 'Go not installed.' unless go_exists
  end
end

Quartz = Quartz::Client.new(file_path: 'app/go/exported_functions.go')