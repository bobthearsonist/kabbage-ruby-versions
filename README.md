setup test enviromment
```
$brew intall rbenv
$rbenv install 2.7.1
$rebenv install 2.5.4
```

install and run with version 2.7.1
```
$rbenv local 2.7.1
$gem install bundle
$bundle install
$rspec
```

install and run with version 2.5.4

```
$rbenv local 2.5.4
$gem install bundle
$bundle install
$rspec
```
run the tests. runtime error for the hash syntax. 2.7.0 was the first version to allow passing a block for the to_h operator. we will have to map manually for 2.5.4

```#=> ArgumentError: wrong array length at 0 (expected 2, was 0)```


update
```
  args = hash.to_h { |x| [x[0], x.drop(1)] } # this is what doesnt work in older ruby 2.5.1 i think was what they were using
```
to be
```
args = hash.reduce({}){ |a,x| a.update( x[0]=> x.drop(1)) } 
```

run the tests again... works fine now.

2.5.4 is EOL so im suprised they aren't using 2.7 in the coderbyte UI. I'm sure they aren't forcing users to use java 1.8 still...

note: if it matters I took a asmall break to clear my head and then put this together using my terminal history in about 20 minutes (including downloading 2.5.4) It took a little bit of time after that to get it into a repository and pushed up.

other note: I didnt diasble th cop for the last return statement... i have a love/hate relationship with rubocop.
