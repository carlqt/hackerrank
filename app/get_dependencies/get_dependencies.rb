require 'net/http'
require 'json'

$global_stash = {}

class DependencyGetter
  URL = 'registry.npmjs.org'

  def initialize(package_name)
    @package_name = package_name
    @host = "/#{package_name}/latest"
  end

  def fetch_dependency
    return [] if $global_stash[@package_name] || json_body["dependencies"].nil?

    $global_stash[@package_name] ||= json_body["dependencies"].keys
  end

  def json_body
    @json_body ||= JSON.parse(body)
  end

  def body
    @body ||= Net::HTTP.get(URL, @host)
  end
end

def get_dependencies(input)
  packages =  DependencyGetter.new(input).fetch_dependency
  return if packages.empty?

  packages.each do |package|
    get_dependencies(package)
  end
end

def get_all_dependencies(input)
  get_dependencies(input)
  $global_stash.keys
end

get_all_dependencies("forever")
