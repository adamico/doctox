group :backend, halt_on_fail: true do
  guard :rspec, cmd: 'bundle exec rspec',
                all_on_start: false, all_after_pass: false,
                failed_mode: :keep do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }

    # Rails example
    watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml)$}) { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
      ["spec/routing/#{m[1]}_routing_spec.rb",
       "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
       "spec/acceptance/#{m[1]}_spec.rb"]
    end
    watch(%r{^spec/support/(.+)\.rb$})                  { 'spec' }
    watch('config/routes.rb')                           { 'spec/routing' }
    watch('app/controllers/application_controller.rb')  { 'spec/controllers' }

    # Capybara features specs
    watch(%r{^app/views/(.+)/.*\.(erb|haml)$}) do |m|
      "spec/features/#{m[1]}_spec.rb"
    end
    watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
      "spec/features/#{m[1]}_spec.rb"
    end
  end

  guard :rubocop, all_on_start: false, cli: %w(--format clang --rails) do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end

  guard 'brakeman', run_on_start: true,
                    cli: 'brakeman -qA4 --no-assume-routes' do
    watch(%r{^app/.+\.(erb|haml|rhtml|rb)$})
    watch(%r{^config/.+\.rb$})
    watch(%r{^lib/.+\.rb$})
    watch('Gemfile')
  end
end
