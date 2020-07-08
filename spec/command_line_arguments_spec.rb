require 'command_line_arguments'

describe do
  it 'can parse an argument' do
    expect(parse_command_arguments('--count g')).to be(0)
  end
  it 'can parse help argument' do
    expect(parse_command_arguments('--name abc --help')).to be(1)
  end
  it 'can detect invlaid argument' do
    expect(parse_command_arguments('--name')).to be(-1)
  end

  it 'can detect no argument' do
    expect(parse_command_arguments('name')).to be(0)
  end

  it 'can detect no argument' do
    expect(parse_command_arguments('')).to be(0)
  end

  it 'can detect help with no argument' do
    expect(parse_command_arguments('--help')).to be(1)
  end
end
