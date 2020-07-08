# return 0 if command line arguments valid
# return 1 if helpo is [present and command line arguments valid
# return -1 if command line arguments invalid
def parse_command_arguments(str)
  split = str.split(/--\s*/)
  hash = split.map(&:split)
  args = args = hash.to_h { |x| [x[0], x.drop(1)] } # this is what doesnt work in older ruby 2.5.1 i think was what they were using
  # args = hash.reduce({}){ |a,x| a.update( x[0]=> x.drop(1)) }  

  # remove the first aprt of the match. this would contain the command. (or if you were vbetter at the regex above it wouldnt be here at all...)
  args.delete(args.keys.first)

  help = args.key?('help')
  valid = args.reject { |k, _v| k == 'help' }.none? { |_k, v| v.empty? }

  return 1 if help && valid
  return 0 if valid

  -1
end
