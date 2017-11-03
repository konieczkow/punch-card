$:<< File.join(File.dirname(__FILE__), '..', 'src')

RSpec::Matchers.define :answer_to do |expected|
  match do |command|
    match = expected.match(command.regexp)
    if @capture_name
      match && @capture_value == match[@capture_name]
    else
      match
    end
  end

  chain :and_capture do |option|
    @capture_name, @capture_value = option.first
  end
end
