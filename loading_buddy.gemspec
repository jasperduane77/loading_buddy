require_relative 'lib/loading_buddy/version'

Gem::Specification.new do |spec|
    spec.name = "loading_buddy"
    spec.version = LoadingBuddy::VERSION
    spec.authors = ["Jasper Mendiola"]
    spec.email   = ["jasperduanemendiola@gmail.com"]

    spec.summary = "A simple progress bar for CLI applications"

    spec.description = "Provides progress bars and spinners for command-line applications"

    spec.license = "MIT"

    spec.required_ruby_version = ">= 2.6.0"
    spec.files         = Dir['lib/**/*', 'README.md', 'LICENSE.txt']
    spec.require_paths = ["lib"]

    spec.add_development_dependency "rspec", "~> 3.0"
    spec.add_development_dependency "rake", "~> 13.0"
end
