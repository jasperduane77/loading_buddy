require_relative 'lib/loading_buddy/version'

Gem::Specification.new do |spec|
    spec.name = "loading_buddy"
    spec.version = LoadingBuddy::VERSION
    spec.authors = ["Jasper Mendiola"]
    spec.email   = ["jasperduanemendiola@gmail.com"]

    spec.summary = "A simple progress bar for CLI applications"

    spec.description = "Provides progress bars for command-line applications"
    spec.homepage    = "https://github.com/jasperduane77/loading_buddy"

    spec.license = "MIT"

    spec.required_ruby_version = ">= 2.6.0"
    spec.files         = Dir['lib/**/*', 'README.md', 'LICENSE.txt']
    spec.require_paths = ["lib"]

    spec.add_development_dependency "rspec", "~> 3.0"
    spec.add_development_dependency "rake", "~> 13.0"

    spec.add_dependency "benchmark", "~> 0.4.0"
end
