# Look puppet-lint, it is documented now.
class hiera5rspec (
  String $message1
) {

  $message2 = lookup('hiera5rspec::message2')
  $message3 = lookup('message3', { 'default_value' => 'This is the default value for message3' })

  $msgs = [ $message1, $message2, $message3 ]

  notify { $msgs: }

}
