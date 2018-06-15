require_relative '../model/book'
require_relative '../model/author'
require_relative '../model/reader'
require_relative '../model/order'
require 'yaml'

class DataProcessing
  PATH = Dir.pwd + '/data/library.yml'.freeze
  def self.reads_library_file
    YAML.load(File.read(PATH))
  end

  def self.writes_library_file(library)
    File.open(PATH, 'w') { |file| file.puts(library.to_yaml) }
  end

  def self.file_exists?
    File.file?(PATH)
  end
end
